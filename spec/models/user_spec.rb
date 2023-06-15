require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should have_many(:posts).with_foreign_key(:author_id) }
    it { should have_many(:comments).with_foreign_key(:author_id) }
    it { should have_many(:likes) }
  end

  describe "methods" do
    let!(:user) { create(:user) }

    describe "#recent_posts" do
      let!(:post1) { create(:post, author: user, created_at: 1.day.ago) }
      let!(:post2) { create(:post, author: user, created_at: 2.days.ago) }
      let!(:post3) { create(:post, author: user, created_at: 3.days.ago) }
      let!(:post4) { create(:post, author: user, created_at: 4.days.ago) }
      let!(:post5) { create(:post, author: user, created_at: 5.days.ago) }
      let!(:post6) { create(:post, author: user, created_at: 6.days.ago) }

      it "returns the most recent posts" do
        expect(user.recent_posts).to eq([post1, post2, post3])
      end

      it "returns the specified limit of recent posts" do
        expect(user.recent_posts(2)).to eq([post1, post2])
      end
    end

    describe "#update_posts_counter" do
      let!(:user) { create(:user) }
      let!(:post) { create(:post, author: user) }

      it "updates the posts counter" do
        expect {
          user.update_posts_counter
          user.reload
        }.to change(user, :posts_counter).by(1)
      end
    end
  end
end
