# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user)    { build(:user) }
  let(:post)    { build(:post) }
  let(:comment) { build(:comment) }
  let(:comment2) { build(:comment) }

  describe '#content' do
    it 'has a content' do
      comment.update(content: 'A comment ccc')
      expect(comment.content).to eq('A comment ccc')
    end

    it 'is not valid if empty' do
      comment.update(content: '')
      expect(comment).to_not be_valid
    end

    it 'should always be set' do
      should validate_presence_of(:content)
    end
  end

  describe '#author' do
    it 'has an author' do
      should validate_presence_of(:user)
    end

    it 'belongs to an author' do
      should belong_to(:user)
    end

    it 'must have an user' do
      comment.user = nil
      comment.save
      expect(comment.errors[:user]).to be_present
    end
  end

  describe '#related subject' do
    it 'is a post' do
      comment.subject = post
      expect(comment.subject_type).to eq('Post')
    end

    it 'is a comment' do
      comment2.subject = comment
      expect(comment2.subject_type).to eq('Comment')
    end

    it "can't be nil"  do
      comment.subject = nil
      comment.save
      expect(comment.errors[:subject]).to be_present
    end
  end

  describe '#likes' do
    it 'initially has no likes' do
      expect(comment.likes).to be_empty
    end

    it 'can have many likes' do
      likes = create_list(:like, 2, subject: comment, post: post)
      comment.likes = likes

      expect(comment.likes).to eq(likes)
    end

    it 'has many likes, generally' do
      should have_many(:likes)
    end
  end

  describe '#comments' do
    it 'initially has no comments' do
      expect(comment.comments).to be_empty
    end

    it 'can have many comments' do
      comment.save
      comments = create_list(:comment, 2, subject: comment, post: post)
      comment.comments = comments

      expect(comment.comments).to eq(comments)
    end

    it 'has many comments, generally' do
      should have_many(:comments)
    end
  end
end
