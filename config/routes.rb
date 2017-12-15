Rails.application.routes.draw do
  root 'static_pages#index'
  get 'friends/index'
  get 'friends/destroy'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests
  resources :posts
  resources :likes

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end