class User < ApplicationRecord
  has_many :friend_requests_sent, foreign_key: :from_user_id, class_name: "FriendRequest"
  has_many :users_sent_to, through: :friend_requests_sent, source: :from_user

  has_many :friend_requests_received, foreign_key: :to_user_id, class_name: "FriendRequest"
  has_many :users_received_from, through: :friend_requests_received, source: :to_user
end
