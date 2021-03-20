Rails.application.routes.draw do
  devise_for :users
  mount ActiveCable.server => '/cable'
   root 'rooms#index'
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
end
