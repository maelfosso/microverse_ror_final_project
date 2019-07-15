class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    flash.now[:error] = 'An error occured!' unless @post.save
    redirect_to params[:target]
  end

  def update
    @post = post.find(params[:id])
    flash.now[:error] = 'An error occured!' unless @post.update(post_params)
    redirect_to params[:target]
  end

  def post_params
    params.require(:post).permit(:title, :content, :user)
  end
end
