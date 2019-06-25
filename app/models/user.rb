class User < ApplicationRecord
  has_many :sent_friend_requests, -> { where("status = 'pending'") },
            class_name: 'Friendship', foreign_key: 'from_user_id'
  has_many :sent_friend_requests_users, through: :sent_friend_requests,
            source: :to_user

  has_many :received_friend_requests, -> { where("status = 'pending'") },
            class_name: 'Friendship', foreign_key: 'to_user_id'
  has_many :received_friend_requests_users, through: :received_friend_requests,
            source: :from_user

  has_many :requested_friendships, -> { where("status = 'accepted'") },
            class_name: 'Friendship', foreign_key: 'from_user_id'
  has_many :requested_friends, through: :requested_friendships,
            source: :to_user

  has_many :accepted_friendships, -> { where("status = 'accepted'") },
            class_name: 'Friendship', foreign_key: 'to_user_id'
  has_many :accepted_friends, through: :accepted_friendships,
            source: :from_user

  has_many :author_posts, class_name: "Post", foreign_key: 'post_id'

  has_many :comments
  has_many :commented_posts, through: :comments, source: :post

  has_many :likes
  has_many :likes_posts, through: :likes, source: :post

  has_many :notifications

  def friend_requests
    sent_friend_requests + received_friend_requests
  end

  def friends
    requested_friends + accepted_friends
  end
end
