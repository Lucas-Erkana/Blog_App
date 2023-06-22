class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    user_id = params[:user_id]
    @posts = Post.where(user_id:)
    @comments = Comment.all
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(title: post_params[:title], text: post_params[:text], user_id: current_user[:id],
                     comment_counter: 0, likes_counter: 0)

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
