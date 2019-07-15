class UsersController < ApplicationController
  def timeline
    @posts = current_user.posts
  end

  def newsfeed
    @posts = current_user.posts + current_user.friends.includes(:posts).map(&:posts)
  end
end
