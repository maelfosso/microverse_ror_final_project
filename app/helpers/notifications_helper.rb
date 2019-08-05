module NotificationsHelper
  def sendNotification(receiver, action, subject)
    if receiver != current_user
      content = "#{current_user.name} " +
        case action
        when 'like' then "liked your #{subject.subject.class.name.downcase!}"
        when 'comment'
          subject.subject.class.name == 'Post' ? "commented on your post" : "replied on your comment"
        when 'request'
          'sent you a friend request'
        when 'accept'
          'accepted your friend request'
        end
      Notification.create(sender: current_user, receiver: receiver, content: content, subject: subject)
    end
  end
end
