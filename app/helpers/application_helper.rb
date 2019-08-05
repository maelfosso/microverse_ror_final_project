# frozen_string_literal: true

module ApplicationHelper
  def data_id(subject)
    case subject.class.name
    when 'Post' then "[data-post-id='#{subject.id}']".html_safe
    when 'Comment' then "[data-comment-id='#{subject.id}']".html_safe
    end
  end

  def path_to_subject(request, params)
    if /^\/posts/ =~ request.fullpath
      Post.find(params[:post_id])
    elsif /^\/comments/ =~ request.fullpath
      Comment.find(params[:comment_id])
    end
  end
end
