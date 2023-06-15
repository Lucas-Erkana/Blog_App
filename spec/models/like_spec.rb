require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe "callbacks" do
    let!(:post) { create(:post) }
    let!(:like) { create(:like, post: post) }

    it "updates the likes counter after creating a like" do
      expect(post.likes_counter).to eq(1)
    end

    it "updates the likes counter after destroying a like" do
      like.destroy
      expect(post.likes_counter).to eq(0)
    end
  end
end
