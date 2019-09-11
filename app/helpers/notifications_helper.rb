# frozen_string_literal: true

module NotificationsHelper
  def send_notification(receiver, action, subject)
    actions = {
      'like' => "liked your #{subject.subject.class.name.downcase!}",
      'comment' => subject.subject.class.name == 'Post' ? 'commented on your post' : 'replied on your comment',
      'request' => 'sent you a friend request',
      'accept' => 'accepted your friend request'
    }

    return nil if receiver == current_user

    content = "#{current_user.username} #{actions[action]}"
    Notification.create(sender: current_user, receiver: receiver, content: content, subject: subject)
  end
end
