# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    if id = params[:u]
      @user = User.find(id)
      @users = @user.friends
    elsif q = params[:s]
      if q == 's'
        @users = current_user.friend_requests[:sent]
        render 'sent'
      elsif q == 'r'
        @users = current_user.friend_requests[:received]
        render 'received'
      end
    else
      @users = []
    end
  end

  def pending
    @requests = User.find(params[:u]).friend_requests
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      send_notification(@friendship.acceptor, 'request', @friendship.requestor)
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to friendships_path(s: 's')
  end

  def update
    @friendship = Friendship.find(params[:id])
    if @friendship.accepted!
      send_notification(@friendship.requestor, 'accept', @friendship.requestor)
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to friendships_path(u: current_user.id)
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to users_path
  end

  def friendship_params
    params.require(:friendship).permit(:requestor_id, :acceptor_id, :status)
  end
end
