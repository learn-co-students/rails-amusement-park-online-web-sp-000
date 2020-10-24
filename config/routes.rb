Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#new', as: 'sigin'
  delete '/sessions', to: 'sessions#destroy'
  resources :users
  resources :rides
  resources :attractions
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end