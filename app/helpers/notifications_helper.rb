# frozen_string_literal: true

module NotificationsHelper
  def send_notification(receiver, action, subject)
    content = "#{current_user.username} " +
              case action
              when 'like'
                "liked your #{subject.subject.class.name.downcase!}"
              when 'comment'
                subject.subject.class.name == 'Post' ? 'commented on your post' : 'replied on your comment'
              when 'request'
                'sent you a friend request'
              when 'accept'
                'accepted your friend request'
              else ''
              end
    Notification.create(sender: current_user, receiver: receiver, content: content, subject: subject)
  end
end
