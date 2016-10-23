class ChangeSortDateTypeFromDateTimeToInt < ActiveRecord::Migration[5.0]
  def change
  	change_column :articles, :sort_date, 'integer USING CAST(sort_date AS integer)'
  end
end
