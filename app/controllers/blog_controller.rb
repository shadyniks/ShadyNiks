class BlogController < ApplicationController
  def index
  	@articles = Article.all.order(:sort_date)
  end
end
