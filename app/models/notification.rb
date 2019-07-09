# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates :user, :content, presence: true
end
