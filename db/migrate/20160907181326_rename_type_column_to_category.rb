class RenameTypeColumnToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :type, :category
  end
end
