class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all.order(id: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to posts_path }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render :destroy
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :body)
  end

end
