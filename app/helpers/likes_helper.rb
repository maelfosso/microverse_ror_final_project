module LikesHelper
  def like_icon(kind)
    if kind == 'thumbs'
      'thumbs-up'
    elsif kind == 'clap'
      'sign-language'
    else
      kind
    end
  end

  def like_name(kind)
    case kind
    when 'thumbs' then 'Like'
    when 'heart' then 'Love'
    when 'clap' then 'Clap'
    when 'laugh' then 'Haha'
    when 'surprise' then 'Wow'
    when 'angry' then 'Angry'
    end
  end

  def liked(subject)
    subject.likes.select{ |like| like.user == current_user }.first
  end

  def subject_likes_path(subject)
    case subject.class.name
    when 'Post' then post_likes_path(subject)
    when 'Comment' then comment_likes_path(subject)
    end
  end
end
