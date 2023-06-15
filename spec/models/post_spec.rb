require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with an author, title, text, comment_counter, and likes_counter' do
    user = User.create(
      name: 'John Doe',
      photo: 'https://example.com/photo.jpg',
      bio: 'Lorem ipsum dolor sit amet.',
      posts_counter: 5
    )
    post = Post.new(
      author: user,
      title: 'Test Post',
      text: 'Lorem ipsum dolor sit amet.',
      comment_counter: 3,
      likes_counter: 10
    )
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'is invalid with a title exceeding 250 characters' do
    post = Post.new(title: 'A' * 251)
    post.valid?
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'is invalid with a negative comment_counter' do
    post = Post.new(comment_counter: -1)
    post.valid?
    expect(post.errors[:comment_counter]).to include('must be greater than or equal to 0')
  end

  it 'is invalid with a negative likes_counter' do
    post = Post.new(likes_counter: -1)
    post.valid?
    expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
  end
end
