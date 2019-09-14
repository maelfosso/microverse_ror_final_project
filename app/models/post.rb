# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, as: :subject, dependent: :destroy
  has_many :comments, as: :subject, dependent: :destroy

  validates :user, :title, :content, presence: true

  scope :latest, -> { order(created_at: :desc) }
end
