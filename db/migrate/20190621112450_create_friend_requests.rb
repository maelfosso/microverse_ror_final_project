class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :from_user, foreign_key: { to_table: :users }
      t.references :to_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
