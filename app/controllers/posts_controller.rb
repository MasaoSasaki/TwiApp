class PostsController < ApplicationController
  def index
    user = User.find(current_user.id)
    @posts = user.posts
  end
  def show
  end
  def new
  end
  def edit
  end
  def create
  end
  def update
  end
  def destroy
  end
end
