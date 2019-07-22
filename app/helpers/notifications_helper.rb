module NotificationsHelper
  def sendNotification(user_id, author, action, subject_type)
    content = "#{author.name} " +
      case action
      when 'like' then "liked your #{subject_type.downcase}"
      when 'comment'
        subject_type == 'Post' ? "commented on your post" : "replied on your comment"
      end
    Notification.create(user_id: user_id, content: content)
  end
end
