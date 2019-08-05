# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :content, null: false
      t.references :subject, polymorphic: true, index: true
      t.references :sender, foreign_key: { to_table: :users }, index: true
      t.references :receiver, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
