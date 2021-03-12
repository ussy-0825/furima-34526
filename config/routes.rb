Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
end
