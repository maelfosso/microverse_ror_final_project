# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :comment, optional: true

  has_many :comments

  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
