Rails.application.routes.draw do
  get 'rides/create'
  resources :users
  resources :attractions
  resources :rides, only: [:create]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  root to: 'application#root'
end
