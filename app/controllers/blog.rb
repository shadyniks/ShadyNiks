Shadyniks::App.controllers :blog do
  
  get :index do
    @posts = Post.all
    render 'blog/index'
  end

  get :show, :with => :id do
    @post = Post.find_by_id(params[:id])
    render 'blog/show'
  end

end
