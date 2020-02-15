Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/signin', to: 'sessions#new'
  post '/ride', to: 'rides#ride'
  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:create, :destroy]
  resources :rides
  resources :users
  resources :attractions
end
