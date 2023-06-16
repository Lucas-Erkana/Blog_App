require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validation' do
    subject { Like.new }

    before { subject.save }

    it 'likes text should contain text' do
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    let(:user) do
      User.create(
        name: 'John Doe',
        photo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
        bio: 'Hello I am a test user',
        posts_counter: 0
      )
    end

    let(:post) do
      Post.create(
        title: 'Test Post',
        text: 'This is a test post',
        user:,
        comment_counter: 0,
        likes_counter: 0
      )
    end

    subject do
      Like.new(
        user:,
        post:
      )
    end

    it 'updates the likes_counter of the post after saving' do
      expect { subject.save }.to change { post.likes_counter }.by(1)
    end
  end
end
