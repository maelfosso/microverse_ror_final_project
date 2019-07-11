# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true

  validates :kind, inclusion: {in: 0..9}
  validates :user, :subject, :kind, presence: true
end
