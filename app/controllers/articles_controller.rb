class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session
  before_filter :init_meta_tags

  def all
    articles = Article.all
    render :json => articles
  end

  def index
    @articles = Article.all.order(:sort_date).to_a
    @featured_article = @articles.slice!(0)
  end

  def show
    @article = Article.find_by(:urlname => params['id'])

    @title = "ShadyNiks - " + @article.title
    @image = @article.image
    if defined?(@article.text)
      @description = @article.text
    end
    if defined?(@article.tags)
      @tags = @article.tags
    end
  end

  def create
    request_data = JSON.parse(request.body.read)
    article = Article.new(request_data["data"]) 
    response = article.save
    render :json => article
  end

  def update
    request_data = JSON.parse(request.body.read)
    response = Article.update(request_data["data"])
    render :json => response.first
  end

  def destroy
    response = Article.delete(params["id"]);
    render :json => response
  end

  def init_meta_tags
    @article_path = request.base_url + request.original_fullpath

    @title = "ShadyNiks"
    @description = "ShadyNiks is a blog dedicated to express the thoughts of the ambiguous, to explore the unimagined and to question 'why not'"
    @image = "http://res.cloudinary.com/drl5zaarh/image/upload/v1473775184/black-bird_u5w5ts.jpg"
    @url = @article_path
  end
end
