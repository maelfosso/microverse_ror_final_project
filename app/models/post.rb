# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, as: :subject, dependent: :destroy
  has_many :comments, as: :subject, dependent: :destroy

  scope :latest, -> { order(created_at: :desc) }

  validates :user, :title, :content, presence: true
end
