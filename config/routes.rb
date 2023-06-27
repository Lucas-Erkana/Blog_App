Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end


  devise_for :users, skip: :all
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  post "users/:user_id/posts", to: "posts#create", as: :user_create_post
end


