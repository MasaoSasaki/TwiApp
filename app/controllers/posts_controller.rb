class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
  end
  def new
    @post = Post.new
  end
  def edit
  end
  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    @posts = Post.all
    if post.save
      redirect_to "/posts"
    else
      render :new
    end
  end
  def update
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to "/posts"
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end
