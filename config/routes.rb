Rails.application.routes.draw do
  root 'static_pages#index'
  get 'friends/index'
  get 'friends/destroy'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friend_requests
  resources :posts do 
  member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
  end
end
 resources :comments

end