require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:friendship) { build(:friendship) }

  it "has status equal to 0 by default" do
    expect(friendship.status).to be(0)
  end

  it "allows status to be changed with valid entry" do
    friendship.status = 1
    expect(friendship.status).to be(1)
  end

  it "creates valid friendship" do
    expect(friendship.save).to be(true)
  end

  context "is not saved because it" do
    it "forbid status not in [0, 1]" do
      friendship.status = 2
      expect(friendship.save).to be false
      expect(friendship.errors[:status]).to be_present
    end

    it "requires acceptor user" do
      friendship.to_user = nil
      friendship.save
      expect(friendship.errors[:to_user]).to be_present
    end

    it "requires requestor user" do
      friendship.from_user = nil
      friendship.save
      expect(friendship.errors[:from_user]).to be_present
    end
  end
end
