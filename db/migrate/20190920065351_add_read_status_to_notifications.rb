# frozen_string_literal: true

class AddReadStatusToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :read_status, :integer, limit: 1, default: 0
  end
end
