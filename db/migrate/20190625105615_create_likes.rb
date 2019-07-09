# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :variety, null: false
      t.integer :subject_id, null: false
      t.string :subject_type, null: false
      t.references :user, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
