class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params, status: 0)
    if @friendship.save
      sendNotification(friendship_params[:acceptor],
                       "#{current_user.name} sent you a friend request")
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to params[:target]
  end

  def update
    @friendship = friendship.find(params[:id])
    if @friendship.update(friendship_params)
      if @friendship.accepted?
        sendNotification(@friendship.requestor,
                         "#{friendship.acceptor.name} accepted your friend request")
      end
    else
      flash.now[:error] = 'An error occured!'
    end
    redirect_to params[:target]
  end

  def friendship_params
    params.require(:friendship).permit(:requestor, :acceptor, :status)
  end
end
