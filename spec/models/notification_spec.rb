require 'rails_helper'

RSpec.describe Notification, :type => :model do
  let(:notif) { build(:notification, content: "The long notification") }

  describe "#content" do

    it "has a content" do
      expect(notif.content).to eql "The long notification"
    end

    it "is not valid if content is empty" do
      notif.content = nil
      expect(notif).to_not be_valid
    end

    it "must have content" do
      should validate_presence_of(:content)
    end

  end

  describe "#author" do

    it "is has an author" do
      should validate_presence_of(:user)
    end

    it "belongs an author" do
      should belong_to(:user)
    end

    it "must have an user" do
      notif.user = nil
      notif.save

      expect(notif.errors[:user]).to be_present

      notif.user = build(:user)
      notif.save

      expect(notif.errors[:user]).to_not be_present
    end

  end

end


# it "is has an author" do
#
# end
#
# it "is not valid without an author" do
#
# end
#
# it "has an author saved in the database" do
#
# end
#
# it "is not valid if the author is not valid" do
#
# end
