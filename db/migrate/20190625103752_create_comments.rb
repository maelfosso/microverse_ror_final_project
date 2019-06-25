class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.date :date
      t.text :content
      t.references :post, foreign_key: {to_table: :posts}, index: true
      t.references :user, foreign_key: {to_table: :users}, index: true
      t.references :comment, foreign_key: {to_table: :comments}, index: true

      t.timestamps
    end
  end
end
