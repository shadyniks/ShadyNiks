class ChangeSortDateTypeFromDateTimeToInt < ActiveRecord::Migration[5.0]
  def change
  	change_column :articles, :sort_date, :integer
  end
end
