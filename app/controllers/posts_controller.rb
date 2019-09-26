# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(post_params)
    flash.now[:error] = 'An error occured!' unless @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    flash.now[:error] = 'An error occured!' unless @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post&.destroy
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
