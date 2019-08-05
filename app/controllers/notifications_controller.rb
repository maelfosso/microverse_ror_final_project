class NotificationsController < ApplicationController
  def index
    @notifs = Notification.where(receiver_id: current_user.id)
  end
end
