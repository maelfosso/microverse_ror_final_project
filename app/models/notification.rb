# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :subject, polymorphic: true

  validates :sender, :receiver, :content, :subject, presence: true
end
