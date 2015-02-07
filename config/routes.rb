Rails.application.routes.draw do
  resources :stores do
    resources :menus
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
