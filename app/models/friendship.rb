# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :requestor, class_name: 'User'
  belongs_to :acceptor, class_name: 'User'

  enum type: %i[pending accepted rejected]

  validates :status, inclusion: { in: type }
end
