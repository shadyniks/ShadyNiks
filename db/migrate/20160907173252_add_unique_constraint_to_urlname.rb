class AddUniqueConstraintToUrlname < ActiveRecord::Migration[5.0]
  def change
    add_index(:articles, :urlname, unique: true)
  end
end
