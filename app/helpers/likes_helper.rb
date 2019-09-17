# frozen_string_literal: true

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
    kinds = {
      'thumbs' => 'Like',
      'heart' => 'Love',
      'clap' => 'Clap',
      'laugh' => 'Haha',
      'surprise' => 'Wow',
      'angry' => 'Angry'
    }

    kinds[kind]
  end

  def liked(subject)
    subject.likes.select { |like| like.user == current_user }.first
  end

  def subject_likes_path(subject)
    case subject.class.name
    when 'Post' then post_likes_path(subject)
    when 'Comment' then comment_likes_path(subject)
    end
  end
end
