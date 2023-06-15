require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content) }
  end

  describe "associations" do
    it { should belong_to(:post) }
    it { should belong_to(:author).class_name('User') }
  end

  describe "callbacks" do
    let!(:post) { create(:post) }
    let!(:comment) { create(:comment, post: post) }

    it "updates the comments counter after create" do
      expect(post.comment_counter).to eq(1)
    end

    it "updates the comments counter after destroy" do
      comment.destroy
      expect(post.comment_counter).to eq(0)
    end

    it "updates the comments counter of the associated post" do
      comment2 = create(:comment, post: post)
      comment3 = create(:comment, post: post)

      expect(post.comment_counter).to eq(3)

      comment2.destroy
      expect(post.comment_counter).to eq(2)
    end
  end
end
