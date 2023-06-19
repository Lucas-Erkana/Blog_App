class PostsController < ApplicationController
  def index
    user = params[:user_id]
    @post = Post.where(user_id: user)
  end

  def show
    @post = Post.find_by(user_id: params[:user_id])
  end
end
