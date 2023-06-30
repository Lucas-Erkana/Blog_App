module Api
  class Api::CommentsController < ApiController
    def index
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @comments = Comment.where(post: @post)

      render json: @comments
    end

    def create
      @comment = Comment.new(comment_params)

      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
      render json: :head
    end

    private

    def comment_params
      params.require(:comment).permit(:author_id, :post_id, :text)
    end
  end
end
