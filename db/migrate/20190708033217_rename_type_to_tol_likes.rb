# frozen_string_literal: true

class RenameTypeToTolLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :type, :tol
  end
end
