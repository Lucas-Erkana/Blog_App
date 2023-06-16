require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    subject { Comment.new(text: 'Nice') }

    before { subject.save }

    it 'Comments text should contain text' do
      subject.text = nil
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
      Comment.new(
        text: 'This is a test comment',
        user:,
        post:
      )
    end

    describe 'Functionality' do
      it 'updates the comments_counter of the post after saving' do
        expect { subject.save }.to change { post.comment_counter }.by(1)
      end
    end
  end
end
