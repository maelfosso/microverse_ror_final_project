class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :commented_users, through: :comments, source: :user

  has_many :likes
  has_many :likes_users, through: :likes, source: :user

end
