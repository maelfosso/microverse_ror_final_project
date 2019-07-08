require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:comment) { build(:comment, content: "A comment ccc") }

  describe "#content" do

    it "has a content" do
      expect(comment.content).to eq("A comment ccc")
    end

    it "is not valid if content empty" do
      comment.content = nil
      expect(comment).to_not be_valid
    end

    it "should always have a content" do
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
      comment.user = nil
      comment.save

      expect(comment.errors[:user]).to be_present

      comment.user = build(:user)
      comment.save

      expect(comment.errors[:user]).to_not be_present
    end

  end

  describe "#post" do

    it "is from a post" do
      should validate_presence_of(:post)
    end

    it "connected to a post" do
      should belong_to(:post)
    end

    it "must have a post" do
      comment.post = nil
      comment.save

      expect(comment.errors[:post]).to be_present

      comment.post = build(:post)
      comment.save

      expect(comment.errors[:post]).to_not be_present
    end

  end

  describe "#comment_parent" do

    it "is valid without a parent comment" do
      comment = build(:comment)
      comment.comment = nil

      expect(comment).to be_valid
      expect(comment.save).to be true
    end

    it "can to be connected to a comment" do
      should belong_to(:comment)
    end

    it "is valid if related to a parent comment" do
      comment.comment = build(:comment)

      expect(comment).to be_valid
      expect(comment.save).to be true
    end

  end

end



# it "is not valid without an author" do
#   expect(comment.save).to be_false
# end
#
# it "has an author saved in the database" do
#
# end
#
# it "is not valid if the author is not valid" do
#
# end

# it "is not valid without a post" do
#
# end
#
# it "has a post saved in the database" do
#
# end
#
# it "is not valid if the post is not valid" do
#
# end
