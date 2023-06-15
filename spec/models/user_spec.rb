require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
      bio: 'Hello I am a test user',
      posts_counter: 0
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'is valid without a photo' do
      subject.photo = ''
      expect(subject).to be_valid
    end

    it 'is not valid when posts_counter is not an integer' do
      subject.posts_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid when posts_counter is less than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end

context 'Testing behavior' do
  subject do
    User.new(
      name: 'John Doe',
      photo: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
      bio: 'Hello I am a test user',
      posts_counter: 0
    )
  end

  before do
    10.times do |i|
      Post.create(
        title: "Post #{i}",
        text: "This is the text for post #{i}",
        user: subject, # Assign the user instance to the user attribute
        comment_counter: 0,
        likes_counter: 0
      )
    end
  end

  it 'lists the most recent 3 posts' do
    expect(subject.recent_post.length).to eq(3)
  end
end
