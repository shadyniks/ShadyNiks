class AddNickname < ActiveRecord::Migration
  def self.up
    remove_column :posts, :nickname, :string
    add_column :accounts, :nickname, :string
  end

  def self.down
    remove_column :accounts, :nickname, :string
  end
end
