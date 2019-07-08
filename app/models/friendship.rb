# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :to_user, class_name: 'User'
  belongs_to :from_user, class_name: 'User'

  validates :status, inclusion: { in: [0, 1] }
end
