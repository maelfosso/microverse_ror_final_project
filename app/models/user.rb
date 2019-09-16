# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy, foreign_key: 'receiver_id'

  validates :username, presence: true

  def friends
    Friendship.accepted.acceptors(self) + Friendship.accepted.requestors(self)
  end

  def friend_requests
    {
      sent: Friendship.pending.acceptors(self),
      received: Friendship.pending.requestors(self)
    }
  end

  def friend_posts
    (Friendship.accepted.acceptors(self) + Friendship.accepted.requestors(self))
      .map { |user| user.posts.latest.includes(:likes, :comments) }.flatten
  end

  def self.new_with_session(param, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] &&
         session['devise.facebook_data']['extra']['raw_info']
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
