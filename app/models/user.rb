class User < ApplicationRecord
  has_many :sent_friend_requests, foreign_key: :from_user_id, class_name: "FriendRequest"
  has_many :sent_friend_requests_users, through: :sent_friend_requests, source: :from_user

  has_many :received_friend_requests, foreign_key: :to_user_id, class_name: "FriendRequest"
  has_many :received_friend_requests_users, through: :received_friend_requests, source: :to_user
end
