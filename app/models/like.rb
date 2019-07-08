# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :tol, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
