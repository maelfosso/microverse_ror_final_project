# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }
  let(:user) { build(:user) }

  describe '#attributes' do
    it 'is composed of title and content' do
      post.title = 'Testing Post'
      expect(post.title).to eql 'Testing Post'

      post.content = 'The long content of the post'
      expect(post.content).to eql 'The long content of the post'
    end

    it 'is not valid if title is empty' do
      post.title = ''
      expect(post).to_not be_valid
    end

    it 'is not valid if content is empty' do
      post.content = ''
      expect(post).to_not be_valid
    end

    it 'must have title and content' do
      should validate_presence_of(:title)
      should validate_presence_of(:content)
    end
  end

  describe '#user' do
    it 'is for an user' do
      should belong_to(:user)
    end

    it 'cannot be saved without an user' do
      post.user = nil
      expect(post.save).to be false
      expect(post.errors[:user]).to be_present

      post.user = user
      expect(post.save).to be true
      expect(post.errors[:user]).to_not be_present
    end
  end

  describe '#comments' do
    it 'initially has no comments' do
      expect(post.comments).to be_empty
    end

    it 'can have many comments' do
      post.comments = create_list(:comment, 2, user: user, post: post)
      expect(post.comments.size).to eq(2)
    end

    it 'has many comments, generally' do
      should have_many(:comments)
    end
  end

  describe '#likes' do
    it 'initially has no likes' do
      expect(post.likes).to be_empty
    end

    it 'can have many likes' do
      post.save
      likes = create_list(:like, 2, user: user, subject: post, post: post)
      post.likes = likes

      expect(post.likes).to eq(likes)
    end

    it 'has many likes, generally' do
      should have_many(:likes)
    end
  end
end
