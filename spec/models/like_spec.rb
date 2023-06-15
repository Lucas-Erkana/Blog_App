require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    let!(:post) { create(:post) }
    let!(:like) { create(:like, post:) }

    it 'updates the likes_counter after creating a like' do
      expect do
        create(:like, post:)
        post.reload
      end.to change(post, :likes_counter).by(1)
    end

    it 'updates the likes_counter after destroying a like' do
      expect do
        like.destroy
        post.reload
      end.to change(post, :likes_counter).by(-1)
    end
  end
end
