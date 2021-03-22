Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => '/cable'
   root 'rooms#index'
   get 'room/index'
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
end
