# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.date :date
      t.integer :status, limit: 1, null: false, default: 0
      t.references :requestor, foreign_key: { to_table: :users }, index: true
      t.references :acceptor, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
