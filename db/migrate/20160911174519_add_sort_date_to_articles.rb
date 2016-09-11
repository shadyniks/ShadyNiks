class AddSortDateToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :sort_date, :datetime
  end
end
