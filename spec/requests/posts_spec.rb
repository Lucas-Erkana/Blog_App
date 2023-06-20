require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    let(:user) { User.create(name: 'Stella', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Rusia.', posts_counter: 0) }

    it 'returns a success response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    let(:user) { User.create(name: 'Stella', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Rusia.', posts_counter: 0) }
    let(:post) do
      Post.create(title: 'Sample Post', text: 'My first post', comment_counter: 0, likes_counter: 0, user: user)
    end

    it 'returns a success response' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(user, post)
      expect(response.body).to include('Here is a given post for a specific user')
    end
  end
end
