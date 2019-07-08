class Notification < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :user, presence: true
end
