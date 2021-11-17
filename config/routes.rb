Rails.application.routes.draw do
  
  get 'relationships/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  devise_for :users
  resources :feeds
  resources :users 
  get'search',to: 'users#search'
  # post 'follow/:id' => 'relationships#follow', as: 'follow'
  # delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  # resources :users, only: [:show] do
  #   get :following, :follower, on: :member
  # end
  resource :relationships, only: [:create,:destroy]

  post 'follow/:id' => 'relationships#create', as: 'follow'
  delete 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
end
