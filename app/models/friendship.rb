# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :acceptor, class_name: 'User'
  belongs_to :requestor, class_name: 'User'

  enum status: %i[pending accepted]

  validates :status, presence: true
end
