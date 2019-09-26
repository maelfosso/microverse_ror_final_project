# frozen_string_literal: true

class NotificationsController < ApplicationController
  def show
    notif = Notification.find(params[:id])
    if notif
      notif.read!
      if notif.subject.respond_to?(:post)
        redirect_to notif.subject.post
      else
        redirect_to notif.sender
      end
    else
      redirect_to root_url
    end
  end

  def index
    @notifs = current_user.notifications.reload.unread
  end
end
