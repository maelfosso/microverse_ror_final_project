# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :commentators, through: :comments, source: :user

  has_many :likes, -> (post) { unscope(:where).
                               where(subject_id: post.id, subject_type: 'post') }
  has_many :likers, through: :likes, source: :user

  validates :title, presence: true
  validates :content, presence: true
end
