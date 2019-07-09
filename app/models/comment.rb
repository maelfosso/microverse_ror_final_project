# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :comment, optional: true

  has_many :comments

  has_many :likes, -> (com) { unscope(:where).
                              where(subject_id: com.id, subject_type: 'comment') }
  has_many :likers, through: :likes, source: :user

  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
