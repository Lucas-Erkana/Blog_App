class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    user_id = params[:user_id]
    @posts = Post.where(user_id: user_id)
    @comments = Comment.all
  end


  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end
end

