require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comment_counter).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe "methods" do
    let!(:post) { create(:post) }

    describe "#update_user_posts_counter" do
      let!(:user) { create(:user) }
      let!(:post) { create(:post, author: user) }

      it "updates the user's posts counter" do
        expect {
          post.update_user_posts_counter
          user.reload
        }.to change(user, :posts_counter).by(1)
      end
    end

    describe "#recent_comments" do
      let!(:comment1) { create(:comment, post: post, created_at: 1.day.ago) }
      let!(:comment2) { create(:comment, post: post, created_at: 2.days.ago) }
      let!(:comment3) { create(:comment, post: post, created_at: 3.days.ago) }
      let!(:comment4) { create(:comment, post: post, created_at: 4.days.ago) }
      let!(:comment5) { create(:comment, post: post, created_at: 5.days.ago) }
      let!(:comment6) { create(:comment, post: post, created_at: 6.days.ago) }

      it "returns the most recent comments" do
        expect(post.recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
      end

      it "returns the specified limit of recent comments" do
        expect(post.recent_comments(3)).to eq([comment1, comment2, comment3])
      end
    end
  end
end
