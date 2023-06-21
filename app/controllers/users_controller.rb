class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.recent_post
  end

  def index
    @users = User.all
  end
end
