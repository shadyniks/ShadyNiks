class AddUrlName < ActiveRecord::Migration
  def self.up
    add_column :posts, :urlname, :string
    add_column :posts, :category, :string
    first_post = Post.first
    first_post.update_attribute(:urlname, "the_immortal_sage")
    first_post.update_attribute(:category, "Poem")
  end

  def self.down
    remove_column :posts, :urlname, :string
    remove_column :posts, :category, :string
  end
end
