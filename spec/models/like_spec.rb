# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }

  context '#variety' do
    it 'is valid' do
      like.save
      expect(like.errors[:variety]).to_not be_present
    end

    it 'is not valid, variety takes values in range(0..9)' do
      should validate_presence_of(:variety)

      like.variety = 10
      like.save
      expect(like.errors[:variety]).to be_present
    end
  end

  context '#subject_id' do
    it 'is valid' do
      like.save
      expect(like.errors[:subject_id]).to_not be_present
    end

    it 'is not valid, subject_id must be present' do
      should validate_presence_of(:subject_id)

      like.subject_id = nil
      like.save
      expect(like.errors[:subject_id]).to be_present
    end
  end

  context '#subject_type' do
    it 'is valid' do
      like.save
      expect(like.errors[:subject_type]).to_not be_present
    end

    it 'is not valid, only post or comment are accepted as subject type' do
      should validate_presence_of(:subject_type)

      like.subject_type = 'article'
      like.save
      expect(like.errors[:subject_type]).to be_present
    end
  end

  context '#author' do
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
end
