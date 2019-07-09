# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user

  validates :variety, presence: true, inclusion: {in: 0..9}
  validates :user, presence: true
  validates :subject_id, presence: true
  validates :subject_type, presence: true, inclusion: {in: %w(post comment)}
end
