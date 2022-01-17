class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(id: "DESC")
  end
  def show
  end
  def new
  end
  def edit
  end
  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      # フォームの中身をクリア（このままだとDoubleRenderエラー）
      # render turbo_stream: turbo_stream.replace(
      #   'post-form',
      #   partial: 'posts/post_form',
      #   locals: {post: Post.new}
      # )
      render turbo_stream: turbo_stream.replace(
        'post-list',
        partial: 'posts/post_list',
        locals: {posts: Post.all.order(id: "DESC")}
      )
    else
      p "NG"
    end
  end
  def update
  end
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render turbo_stream: turbo_stream.replace(
        'post-list',
        partial: 'posts/post_list',
        locals: {posts: Post.all.order(id: "DESC")}
      )
    end
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

end
