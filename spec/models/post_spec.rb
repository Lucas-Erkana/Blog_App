require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Fuad', posts_counter: 0) }
  subject do
    Post.new(user_id: user.id, title: 'Hello', text: 'This is my post', comment_counter: 1, likes_counter: 1)
  end

  context 'Testing validation' do
    it 'Title should be invalid with nil value' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      expect(subject.title.length).to be <= 250
    end

    it 'CommentsCounter must be an integer greater than or equal to zero.' do
      subject.comment_counter = -1
      expect(subject).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero.' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should update count of posts' do
      expect(subject.post_count_updater).to be true
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

    subject do
      Post.new(
        title: 'Test Post',
        text: 'This is a test post',
        user:,
        comment_counter: 0,
        likes_counter: 0
      )
    end

    it 'returns the five most recent comments' do
      10.times do |i|
        Comment.create(
          text: "This is the text for comment #{i}",
          post: subject,
          user:
        )
      end

      expect(subject.recent_comments.length).to eq(5)
    end

    it 'updates the posts_counter of the author after saving' do
      expect { subject.save }.to change { user.posts_counter }.by(1)
    end
  end
end
