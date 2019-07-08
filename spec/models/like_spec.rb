# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }

  describe '#type' do
    it 'has a type' do
      like.tol = 2
      expect(like.tol).to eql(2)
    end

    it 'is not valid if type is empty' do
      should validate_presence_of(:tol)
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
      like.user = nil
      like.save
      expect(like.errors[:user]).to be_present

      like.user = build(:user)
      like.save
      expect(like.errors[:user]).to_not be_present
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
      like.post = nil
      like.save
      expect(like.errors[:post]).to be_present

      like.post = build(:post)
      like.save
      expect(like.errors[:post]).to_not be_present
    end
  end
end
