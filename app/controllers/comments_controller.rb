class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      subject = comment_params[:suject]
      sendNotification(subject.user,
                       "#{current_user.name} commented on your "\
                       "#{subject.class == 'Post' ? 'post' : 'comment'}")
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to params[:target]
  end

  def update
    @comment = Comment.find(params[:id])
    flash.now[:error] = 'An error occured!' unless @comment.update(comment_params)
    redirect_to params[:target]
  end

  def comment_params
    params.require(:comment).permit(:user, :subject)
  end
end
