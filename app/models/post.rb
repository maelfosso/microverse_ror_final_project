# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true

  has_many :comments
  has_many :commented_users, through: :comments, source: :user

  has_many :likes
  has_many :likes_users, through: :likes, source: :user

  validates :title, presence: true
  validates :content, presence: true
end
