class NotificationsController < ApplicationController
  def index
    @notifs = Notification.where(user_id: current_user.id)
  end
end
