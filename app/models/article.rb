class Article < ApplicationRecord
  validates :title, :text, :image, :author, :category, :urlname, presence: true
  validates :urlname, uniqueness: true
end
