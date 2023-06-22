class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    if @user.user_has_liked(params[:post_id])
      @user.remove_user_like(params[:post_id])
    else
      @user.add_user_like(params[:post_id])
    end

    redirect_to request.path
  end
end
