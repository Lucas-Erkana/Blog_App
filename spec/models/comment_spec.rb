require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with a post, author, and text" do
    user = User.create(
      name: 'John Doe',
      photo: 'https://example.com/photo.jpg',
      bio: 'Lorem ipsum dolor sit amet.',
      posts_counter: 5
    )
    post = Post.create(
      author: user,
      title: 'Test Post',
      text: 'Lorem ipsum dolor sit amet.',
      comment_counter: 3,
      likes_counter: 10
    )
    comment = Comment.new(
      post: post,
      author: user,
      text: 'Test comment'
    )
    expect(comment).to
