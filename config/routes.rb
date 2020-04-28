Rails.application.routes.draw do
  resources :users
  get '/signin', to: 'sessions#login'
  post 'sessions/create' 
  get '/logout', to: 'sessions#destroy'
  resources :rides
  resources :attractions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'


end
