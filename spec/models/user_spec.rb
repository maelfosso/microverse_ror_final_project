# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { build(:user) }
  let(:user2) { build(:user) }
  let(:user3) { build(:user) }
  let(:friendship1) { create(:friendship, requestor: user1, acceptor: user2) }
  let(:friendship2) { create(:friendship, requestor: user1, acceptor: user3) }
  let(:friendship3) { create(:friendship, requestor: user2, acceptor: user3) }

  describe 'validations' do
    context 'complete required info' do
      it 'is valid' do
        expect(user1).to be_valid
      end
    end

    # context 'username is missing' do
    #   it 'is not valid' do
    #     user1.update(username: '')
    #     expect(user1.errors[:username]).to include("can't be blank")
    #   end
    # end
  end

  describe 'friendships' do
    context 'with pending status' do
      before(:each) do
        friendship1
        friendship2
        friendship3
      end

      it 'shows friend requests' do
        expect(user1.friend_requests[:sent]).to eq([user2, user3])
        expect(user3.friend_requests[:received]).to eq([user1, user2])
      end
    end

    context 'with accepted status' do
      before(:each) do
        friendship2.accepted!
        friendship3.accepted!
      end

      it 'shows friends' do
        expect(user3.friends).to eq([user1, user2])
      end

      it 'updates friend requests' do
        expect(user3.friend_requests[:received]).to be_empty
      end
    end
  end
end
