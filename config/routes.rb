Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resources :attractions
  resources :rides, only: [:create]
  resources :sessions, only: [:create]
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  root 'static#home'
end
