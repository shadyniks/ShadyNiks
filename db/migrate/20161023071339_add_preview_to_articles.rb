class AddPreviewToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :preview, :string
  end
end
