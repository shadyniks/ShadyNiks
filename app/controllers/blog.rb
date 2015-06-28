Shadyniks::App.controllers :blog do
  
  get :index do
    @posts = Post.all
    render 'blog/index'
  end

  get :read, :with => :name do
    @post = Post.by_name(params[:name])
    render 'blog/show'
  end

end
