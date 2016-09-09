class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string   "title"
      t.text     "text"
      t.string   "image"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "author"
      t.string   "urlname"
      t.string   "type"

      t.timestamps
    end
  end
end
