Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#welcome'

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post '/destroy', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'
  
  resources :users
  resources :attractions
end
