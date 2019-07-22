class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      sendNotification(params[:subject_author_id], current_user,
                       'comment', comment_params[:subject_type])
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to root_path
  end

  def update
    @comment = Comment.find(params[:id])
    flash.now[:error] = 'An error occured!' unless @comment.update(comment_params)
    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit(:user_id, :subject_id, :subject_type, :content)
  end
end
