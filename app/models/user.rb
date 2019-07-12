# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_friend_requests, -> { where('status = 0') },
           class_name: 'Friendship', foreign_key: 'from_user_id'
  has_many :sent_friend_requests_users, through: :sent_friend_requests,
                                        source: :to_user

  has_many :received_friend_requests, -> { where('status = 0') },
           class_name: 'Friendship', foreign_key: 'to_user_id'
  has_many :received_friend_requests_users, through: :received_friend_requests,
                                            source: :from_user

  has_many :requested_friendships, -> { where('status = 1') },
           class_name: 'Friendship', foreign_key: 'from_user_id'
  has_many :requested_friends, through: :requested_friendships,
                               source: :to_user

  has_many :accepted_friendships, -> { where('status = 1') },
            class_name: 'Friendship', foreign_key: 'to_user_id'
  has_many :accepted_friends, through: :accepted_friendships,
                              source: :from_user

  has_many :author_posts, class_name: 'Post', foreign_key: 'post_id'

  has_many :comments
  has_many :commented_posts, through: :comments,
            source: :subject, source_type: 'Post'
  has_many :commented_comments, through: :comments,
            source: :subject, source_type: 'Comment'

  has_many :likes
  has_many :liked_posts, through: :likes, source: :subject, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :subject, source_type: 'Comment'

  has_many :notifications

  validates :username, presence: true

  def friend_requests
    sent_friend_requests_users + received_friend_requests_users
  end

  def friends
    requested_friends + accepted_friends
  end

  def self.new_with_session(param, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user["email"] = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    pp auth
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.username = auth.info.name.delete(" ").downcase

      user.provider = auth.provider
      user.uid = auth.uid
      user.photo_path = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      user.save!
    end
  end

end
