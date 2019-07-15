class LikesController < ApplicationController
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
    redirect_to params[:target]
  end

  def update
    @like = Like.find(params[:id])
    flash.now[:error] = 'An error occured!' unless @like.update(like_params)
    redirect_to params[:target]
  end

  def like_params
    params.require(:like).permit(:user, :subject, :kind)
  end
end
