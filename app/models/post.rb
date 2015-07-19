class Post < ActiveRecord::Base

  belongs_to :account
  validates_presence_of     :title
  validates_presence_of     :body
  validates_presence_of     :image
  validates_presence_of     :urlname
  validates_uniqueness_of   :urlname,    :case_sensitive => false
  validates_format_of       :urlname,     :with => /[A-Za-z0-9_]/

  #==================== Scopes
  scope :by_name, -> (name) {where("urlname = ? ", name)}

  def self.makePretty(body, body_arr = [], formatters = nil)
    # puts formatters
    if formatters.nil?
      formatters = {"D" => {"type" => "description"}, "Q" => {"type" => "quote", "sub_formatters" => {"QM" => {"type" => "quote"}, "QA" => {"type" => "author"}}}, 
                  "P" => {"type" => "poem", "sub_formatters" => {"PT" => {"type" => "title"}, "PM" => {"type" => "poem"}, "PA" => {"type" => "author"}}}}
    end
    # puts formatters
    formatters_arr = formatters.keys

    return body_arr if body.nil? || body.blank?
    
    formatter = body[/\|(.*?)\|/,1]

    body = body.gsub("\n", "new123")

    pretty = body[/\|#{formatter}\|(.*?)\|\*#{formatter}\|/,1]
    body = body.split("|#{formatter}|#{pretty}|*#{formatter}|").last
    
    pretty = pretty.gsub("new123", "\n") if !pretty.nil? && !pretty.blank?
    body = body.gsub("new123", "\n") if !body.nil? && !body.blank?


    arr_elem = {"type" => formatters[formatter]["type"], "content" => pretty}
    # puts formatters[formatter]["sub_formatters"]
    arr_elem["content"] = Post.makePretty(pretty, [], formatters[formatter]["sub_formatters"]) if !formatters[formatter].nil? && !formatters[formatter]["sub_formatters"].nil?

    body_arr.push(arr_elem)

    Post.makePretty(body, body_arr, formatters)
  end
end
