class ChangeSortDateTypeFromDateTimeToBigInt < ActiveRecord::Migration[5.0]
  def change
  	change_column :articles, :sort_date, :bigint
  end
end
