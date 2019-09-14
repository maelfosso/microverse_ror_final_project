# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :acceptor, class_name: 'User'
  belongs_to :requestor, class_name: 'User'

  enum status: %i[pending accepted]

  validates :status, presence: true

  def self.acceptors(user)
    where(requestor_id: user.id).includes(:acceptor).map(&:acceptor)
  end

  def self.requestors(user)
    where(acceptor_id: user.id).includes(:requestor).map(&:requestor)
  end

  def self.between(user1, user2)
    where('requestor_id = ? AND acceptor_id = ?', user1.id, user2.id)
      .or(where('requestor_id = ? AND acceptor_id = ?', user2.id, user1.id)).first
  end
end
