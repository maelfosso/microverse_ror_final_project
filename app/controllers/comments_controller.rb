# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @subject = path_to_subject(request, params)
    @comments = @subject.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @subject = @comment.subject
      send_notification(@subject.user, 'comment', @comment)
    else
      flash.now[:error] = 'An error occured!'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @subject = @comment.subject
  end

  def update
    @comment = Comment.find(params[:id])
    @subject = @comment.subject
    flash.now[:error] = 'An error occured!' unless @comment.update(comment_params)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @subject = @comment.subject
    flash.now[:error] = 'An error occured!' unless @comment.destroy
  end

  def comment_params
    params.require(:comment).permit(:user_id, :subject_id, :subject_type, :post_id, :content)
  end
end
