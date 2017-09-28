Rails.application.routes.draw do
  root to: 'home#index'

  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#index'
end
