# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:user2) { build(:user) }
  let(:user3) { build(:user) }

  it 'creates valid user' do
    expect(user.save).to be(true)
  end

  context 'is not saved because it' do
    it 'forbides blank username' do
      user = build(:user, username: '')
      user.save
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'requires valid email' do
      user = build(:user, email: '')
      user.save
      expect(user.errors[:email]).to include("can't be blank")

      user.email = 'wrongmicro.com'
      user.save
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'requires password to contain at least 6 characters' do
      user = build(:user, password: '')
      user.save
      expect(user.errors[:password]).to include("can't be blank")

      user.password = 'admin'
      user.save
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end

  context 'friendships' do
    before(:each) do
      @f1 = create(:friendship, to_user: user2, from_user: user)
      @f2 = create(:friendship, to_user: user3, from_user: user)
    end

    it 'creates friend requests' do
      expect(user.sent_friend_requests_users.to_a).to eq([user2, user3])
    end

    it 'shows friend requests' do
      expect(user2.friend_requests.to_a).to eq([user])
      expect(user3.friend_requests.to_a).to eq([user])
      expect(user.friend_requests.to_a).to eq([user2, user3])
    end

    it 'accepts friendship' do
      @f1.update(status: 1)
      expect(@f1.status).to be(1)
      expect(@f2.status).to be(0)
    end

    it 'loads friends' do
      @f1.update(status: 1)
      expect(user3.friends.to_a).to eq([])
      expect(user.friends.to_a).to eq([user2])
      expect(user2.friends.to_a).to eq([user])
    end
  end
end
