require 'rails_helper'

RSpec.describe Post, :type => :model do
  let (:post) {build(:post, title: "Testing Post", content: "The long content of the post")}
  let (:user) {build(:user, name: "Foo", username: "foo", password: "foo", password_digest: "foo")}

  describe "#attributes" do

    it "is composed of title and content" do
      expect(post.title).to eql "Testing Post"
      expect(post.content).to eql "The long content of the post"
    end

    it "is not valid if title is empty" do
      post.title = nil

      expect(post).to_not be_valid
    end

    it "is not valid if content is empty" do
      post.content = nil

      expect(post).to_not be_valid
    end

  end

  describe "#user" do

    it "is for an user" do
      expect(post.user).to be_nil

      # post.user =
    end

    it "cannot be save without an user" do
      r = post.save
      expect(r).to be false
      expect(post.errors[:user]).to be_present

      post.user = user
      r = post.save

      expect(r).to be true
      expect(post.errors[:user]).to_not be_present
    end

    # it "is not valid if the destinated user is not valid" do
    #   user.name = nil
    #   post.user = user
    #
    #   r = post.save
    #   pp post.errors
    #   expect(r).to be false
    #   expect(post.errors[:user]).to be_present
    # end

  end

  describe "#comments" do

    it "initially has no comments" do
      expect(post.comments).to be_empty
    end

    it "can have many comments" do
      post = create(:post, title: "Testing Post", content: "The long content of the post", user: user)

      comment1 = post.comments.create!(content: "Comment 1", user: user)
      comment2 = Comment.create(content: "Comment 2", user: user)
      post.comments << comment2

      expect(post.reload.comments).to eq([comment1, comment2])
    end

    it "has many comments, generally" do
      should have_many(:comments)
    end

  end

  describe "#likes" do

    it "initially has no likes" do
      expect(post.likes).to be_empty
    end

    it "can have many comments" do
      post = create(:post, title: "Testing Post", content: "The long content of the post", user: user)

      like1 = post.likes.create!(tol: 2, user: user)
      like2 = Like.create(tol: 3, user: user)
      post.likes << like2

      expect(post.reload.likes).to eq([like1, like2])
    end

    it "has many comments, generally" do
      should have_many(:likes)
    end

  end
  # it "orders them in reverse chronologically" do
  #       post = Post.create!
  #       comment1 = post.comments.create!(:body => "first comment")
  #       comment2 = post.comments.create!(:body => "second comment")
  #       expect(post.reload.comments).to eq([comment2, comment1])
  #     end

end
