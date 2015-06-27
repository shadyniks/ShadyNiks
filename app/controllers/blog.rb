Shadyniks::App.controllers :blog do
  
  get :index do
    @posts = Post.all
    render 'blog/index'
  end

  get :read, :with => :id do
    @post = Post.find_by_id(params[:id])
    logger.debug @post.inspect
  end

end
