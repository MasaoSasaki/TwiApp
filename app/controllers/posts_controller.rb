class PostsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @posts = user.posts
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
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end
