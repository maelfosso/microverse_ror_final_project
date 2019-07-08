require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe "#content" do
    # let(:post) = { build(:post, title: "Testing Post", content: "The long content of the post") }

    it "has a content" do
      # expect(post)
    end

    it "is not valid if content empty" do

    end

  end

  describe "#author" do

    it "is has an author" do

    end

    it "is not valid without an author" do

    end

    it "has an author saved in the database" do

    end

    it "is not valid if the author is not valid" do

    end

  end

  describe "#post" do

    it "is from a post" do

    end

    it "is not valid without a post" do

    end

    it "has a post saved in the database" do

    end

    it "is not valid if the post is not valid" do

    end

  end

  describe "#comment_parent" do

    it "is valid without a parent comment" do

    end

    it "can to be connected to a comment" do

    end

    it "is valid if related to a parent comment" do

    end

  end

end
