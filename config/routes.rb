Rails.application.routes.draw do
  devise_for :users
  
  namespace :api do
    get '/users/:user_id/posts', to: 'posts#index'
    post '/comments', to: 'comments#create'
    get '/users/:user_id/posts/:post_id/comments', to: 'comments#index'
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end

  devise_for :users, skip: :all
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
  post "users/:user_id/posts", to: "posts#create", as: :user_create_post
end
