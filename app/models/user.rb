class User < ApplicationRecord
  has_many :friend_requests_sent, foreign_key: :from_user, class_name: "FriendRequest"
  has_many :friend_requests_received, foreign_key: :to_user, class_name: "FriendRequest"
end
