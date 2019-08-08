# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :requested_friendships, class_name: 'Friendship',
            foreign_key: 'requestor_id', dependent: :destroy
  has_many :received_friendships, class_name: 'Friendship',
            foreign_key: 'acceptor_id', dependent: :destroy

  has_many :posts, -> {includes(:likes, :comments).order(id: :desc)}, dependent: :destroy
  has_many :notifications, dependent: :destroy, foreign_key: 'receiver_id'

  validates :username, presence: true

  def friend_requests
    {sent: requested_friendships.pending.includes(:acceptor).map(&:acceptor),
     received: received_friendships.pending.includes(:requestor).map(&:requestor)}
  end

  def friends
    requested_friendships.accepted.includes(:acceptor).map(&:acceptor) +
    received_friendships.accepted.includes(:requestor).map(&:requestor)
  end

  def friend_posts
    requested_friendships.accepted.includes(acceptor: [posts: [:likes, :comments]]).map(&:acceptor).map(&:posts).flatten +
    received_friendships.accepted.includes(requestor: [posts: [:likes, :comments]]).map(&:requestor).map(&:posts).flatten
  end

  def friendship(u)
    Friendship.where("requestor_id = #{id} AND acceptor_id = #{u.id} OR "\
                     "requestor_id = #{u.id} AND acceptor_id = #{id}").first
  end

  def self.new_with_session(param, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user["email"] = data["email"] if user.email.blank?
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
      user.nationality = auth.info.address.name
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name.delete(" ").downcase
    end
  end

end
