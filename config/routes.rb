Rails.application.routes.draw do
  resources :stores

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
