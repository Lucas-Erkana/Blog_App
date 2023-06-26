class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @likes = Like.create(user_id: @user.id, post_id: params[:post_id])
    redirect_to request.path
  end
end
