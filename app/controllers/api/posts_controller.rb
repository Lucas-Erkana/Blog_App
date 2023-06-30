module Api
  class Api::PostsController < ApiController
    def index
      @user = User.find(params[:user_id])
      @posts = Post.where(user_id: @user.id).includes(:comments)
      render json: @posts
    end
  end
end
