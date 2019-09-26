# frozen_string_literal: true

class Notification < ApplicationRecord
  enum read_status: %i[unread read]

  belongs_to :sender, class_name: 'User'
  belongs_to :subject, polymorphic: true
  belongs_to :receiver, class_name: 'User'

  validates :sender, :receiver, :content, :subject, presence: true
end
