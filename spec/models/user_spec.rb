require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, photo, bio, and posts_counter' do
    user = User.new(
      name: 'John Doe',
      photo: 'https://example.com/photo.jpg',
      bio: 'Lorem ipsum dolor sit amet.',
      posts_counter: 5
    )
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a negative posts_counter' do
    user = User.new(posts_counter: -1)
    user.valid?
    expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
  end
end
