# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :subject
  has_many :commentators, through: :comments, source: :user

  has_many :likes, as: :subject
  has_many :likers, through: :likes, source: :user

  validates :user, :title, :content, presence: true
end
