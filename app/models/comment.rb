# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :subject, polymorphic: true

  has_many :likes, as: :subject, dependent: :destroy
  has_many :comments, -> { includes(:likes).order(id: :asc) }, as: :subject, dependent: :destroy

  validates :user, :subject, :content, presence: true
end
