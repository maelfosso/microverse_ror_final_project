# frozen_string_literal: true

class LikesController < ApplicationController
  def index
    @likes = path_to_subject(request, params).likes
  end

  def create
    @subject = params[:subject_type].constantize.find(params[:subject_id])
    @like = @subject.likes.create(user_id: current_user.id, kind: params[:kind], post_id: params[:post_id])
    if @like
      send_notification(@subject.user, 'like', @like)
    else
      flash.now[:error] = 'An error occured!'
    end
  end

  def update
    @like = Like.find(params[:id])
    @subject = @like.subject
    flash.now[:error] = 'An error occured!' unless @like.update(kind: params[:kind])
  end

  def destroy
    @like = Like.find(params[:id])
    @subject = @like.subject
    flash.now[:error] = 'An error occured!' unless @like.destroy
  end
end
