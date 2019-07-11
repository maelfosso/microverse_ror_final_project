# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }
  let(:post) { build(:post) }
  let(:comment) { build(:comment) }

  context '#kind' do
    it 'is valid' do
      like.save
      expect(like.errors[:kind]).to_not be_present
    end

    it 'is not valid, kind takes values in range(0..9)' do
      should validate_presence_of(:kind)

      like.kind = 10
      like.save
      expect(like.errors[:kind]).to be_present
    end
  end

  context '#related subject' do
    it 'is a post' do
      like.subject = post
      expect(like.subject_type).to eq('Post')
    end

    it 'is a comment' do
      like.subject = comment
      expect(like.subject_type).to eq('Comment')
    end

    it "can't be nil"  do
      comment.subject = nil
      comment.save
      expect(comment.errors[:subject]).to be_present
    end
  end

  context '#author' do
    it 'has an author' do
      should validate_presence_of(:user)
    end

    it 'belongs to an author' do
      should belong_to(:user)
    end

    it 'must have an user' do
      like.user = nil
      like.save
      expect(like.errors[:user]).to be_present

      like.user = build(:user)
      like.save
      expect(like.errors[:user]).to_not be_present
    end
  end
end
