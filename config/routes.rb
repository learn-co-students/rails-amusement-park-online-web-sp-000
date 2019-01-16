Rails.application.routes.draw do
  root 'application#welcome'
  resources :users
  resources :attractions
  post '/rides', to: 'rides#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
