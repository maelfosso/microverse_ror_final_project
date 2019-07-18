class LikesController < ApplicationController
  def index
    if /\A\/posts/ =~ request.path
      @likes = Post.find(params[:post_id]).likes
    elsif /\A\/comments/ =~ request.path
      @likes = Comment.find(params[:comment_id]).likes
    end
  end

  def create
    @like = Like.new(like_params)
    if @like.save
      subject = like_params[:subject]
      sendNotification(subject.user,
                       "#{current_user.name} react to your "\
                       "#{subject.class == 'Post' ? 'post' : 'comment'}")
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
    params.permit(:user, :subject, :kind)
  end
end
