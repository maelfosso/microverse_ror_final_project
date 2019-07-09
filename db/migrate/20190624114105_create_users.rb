# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.binary :photo
      t.string :gender
      t.date :date_of_birth
      t.string :nationality
      t.string :username, null: false

      t.timestamps
    end
  end
end
