# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :type
      t.references :post, foreign_key: { to_table: :posts }, index: true
      t.references :user, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
