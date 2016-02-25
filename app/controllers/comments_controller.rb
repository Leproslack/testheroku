class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comments_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable, notice: "Your comment was successfully posted."
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to :back
  end
  

  private

    def comments_params
      params.require(:comment).permit(:body)
    end

end
