class UsersController < ApplicationController
  def home
    @posts = current_user.posts + current_user.friend_posts
  end

  def index
    @users = User.where("users.id != #{current_user.id}")
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
