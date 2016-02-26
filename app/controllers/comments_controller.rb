class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comments

  def create
    @comment = @commentable.comments.new comments_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable, notice: "Your comment was successfully posted."
  end

  def upvote
    @comment.upvote_by current_user
    redirect_to :back
  end
  

  private

    def find_comments
      @comment = Comment.find(params[:id])
    end

    def comments_params
      params.require(:comment).permit(:body)
    end

end
