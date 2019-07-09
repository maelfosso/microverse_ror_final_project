# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user)    { build(:user) }
  let(:comment) { build(:comment) }

  describe '#content' do
    it 'has a content' do
      comment.content = 'A comment ccc'
      expect(comment.content).to eq('A comment ccc')
    end

    it 'is not valid if content empty' do
      comment.content = ''
      expect(comment).to_not be_valid
    end

    it 'should always have a content' do
      should validate_presence_of(:content)
    end
  end

  describe '#author' do
    it 'is has an author' do
      should validate_presence_of(:user)
    end

    it 'belongs an author' do
      should belong_to(:user)
    end

    it 'must have an user' do
      comment.user = nil
      comment.save
      expect(comment.errors[:user]).to be_present

      comment.user = build(:user)
      comment.save
      expect(comment.errors[:user]).to_not be_present
    end
  end

  describe '#post' do
    it 'is from a post' do
      should validate_presence_of(:post)
    end

    it 'connected to a post' do
      should belong_to(:post)
    end

    it 'must have a post' do
      comment.post = nil
      comment.save
      expect(comment.errors[:post]).to be_present

      comment.post = build(:post)
      comment.save
      expect(comment.errors[:post]).to_not be_present
    end
  end

  describe '#comment_parent' do
    it 'is valid without a parent comment' do
      comment.comment = nil
      expect(comment.save).to be true
    end

    it 'can to be connected to a comment' do
      should belong_to(:comment)
    end

    it 'is valid if related to a parent comment' do
      comment.comment = build(:comment)
      expect(comment.save).to be true
    end
  end

  describe '#likes' do
    it 'initially has no likes' do
      expect(comment.likes).to be_empty
    end

    it 'can have many likes' do
      comment.save
      likes = create_list(:like, 2, user: user,
                          subject_id: comment.id, subject_type: 'comment')
      comment.likes = likes

      expect(comment.likes).to eq(likes)
    end
  end
end
