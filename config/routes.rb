Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  mount ActionCable.server => '/cable'
   root 'rooms#index'
   get 'room/index'
   resources :users, only: [:show] do
    get :search, on: :collection
    get :followings, on: :member
    get :followers, on: :member
  end
  
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :relationships, only: [:create, :destroy]
end
