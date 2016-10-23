class ChangeSortDateTypeFromDateTimeToInt < ActiveRecord::Migration[5.0]
  def change
  	remove_column :articles, :sort_date
  	add_column :articles, :sort_date, :integer
  end
end
