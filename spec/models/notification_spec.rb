# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:notif) { build(:notification) }

  describe '#content' do
    it 'has a content' do
      notif.content = 'The long notification'
      expect(notif.content).to eql 'The long notification'
    end

    it 'is not valid if content is empty' do
      notif.content = ''
      expect(notif).to_not be_valid
    end

    it 'must have content' do
      should validate_presence_of(:content)
    end
  end

  describe '#sender' do
    it 'must have a sender' do
      should validate_presence_of(:sender)
    end

    it 'belongs to a sender' do
      should belong_to(:sender)
    end
  end

  describe '#receiver' do
    it 'must have a receiver' do
      should validate_presence_of(:receiver)
    end

    it 'belongs to a receiver' do
      should belong_to(:receiver)
    end
  end

  describe '#subject' do
    it 'must have a subject' do
      should validate_presence_of(:subject)
    end

    it 'belongs to a subject' do
      should belong_to(:subject)
    end
  end
end
