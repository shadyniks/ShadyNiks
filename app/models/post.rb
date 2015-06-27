class Post < ActiveRecord::Base

  belongs_to :account
  validates_presence_of     :title
  validates_presence_of     :body
  validates_presence_of     :image
  validates_presence_of     :urlname
  validates_uniqueness_of   :urlname,    :case_sensitive => false
  validates_format_of       :urlname,     :with => /[A-Za-z0-9_]/
end
