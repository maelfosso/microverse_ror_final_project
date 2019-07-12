# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :acceptor, class_name: 'User'
  belongs_to :requestor, class_name: 'User'

  enum status: %i[pending accepted rejected]

  validates :status, presence: true

  def accept
    update(status: 1)
  end

  def reject
    update(status: 2)
  end
end
