class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.recent_post
    @post_counter = @user.posts.length
  end

  def index
    @users = User.all
  end
end
