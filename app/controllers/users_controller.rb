# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.where("users.id != #{current_user.id}")
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.latest.includes(:likes, :comments)
  end
end
