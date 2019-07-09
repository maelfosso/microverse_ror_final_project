# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  has_many :comments, as: :subject

  has_many :likes, as: :subject
  has_many :likers, through: :likes, source: :user

  validates :user, :subject, :content, presence: true
end
