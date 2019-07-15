module NotificationsHelper
  def sendNotification(recepient, content)
    notif = Notification.new
    notif.user = recepient
    notif.content = content
    notif.save
  end
end
