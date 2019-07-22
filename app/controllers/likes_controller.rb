class LikesController < ApplicationController
  def index
    @likes = Post.find(params[:post_id]).likes
  end

  def create
    @like = Like.new(like_params)
    if @like.save
      sendNotification(params[:subject_author_id], current_user,
                       'like', comment_params[:subject_type])
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to root_path
  end

  def update
    @like = Like.find(params[:id])
    flash.now[:error] = 'An error occured!' unless @like.update(like_params)
    redirect_to root_path
  end

  def like_params
    params.permit(:user_id, :subject_id, :subject_type, :kind)
  end
end
