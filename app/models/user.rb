# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy, foreign_key: 'receiver_id'
  has_many :received_friendships,
           dependent: :destroy, class_name: 'Friendship', foreign_key: 'acceptor_id'
  has_many :requested_friendships,
           dependent: :destroy, class_name: 'Friendship', foreign_key: 'requestor_id'

  validates :username, presence: true

  def friends
    requested_friendships.accepted.acceptors + received_friendships.accepted.requestors
  end

  def friend_requests
    {
      sent: requested_friendships.pending.acceptors,
      received: received_friendships.pending.requestors
    }
  end

  def friend_posts
    (requested_friendships.accepted.acceptors + received_friendships.accepted.requestors)
      .map { |user| user.posts.latest.includes(:likes, :comments) }.flatten
  end

  def self.new_with_session(param, session)
    super.tap do |user|
      if (data = session['devise.facebook_data']) && data['extra']['raw_info']
        user['email'] = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.gender = auth.info.gender
      user.photo_path = auth.info.image
      user.date_of_birth = auth.info.birthday
      user.password = Devise.friendly_token[0, 20]
      user.username = user.name.delete(' ').downcase
    end
  end
end
