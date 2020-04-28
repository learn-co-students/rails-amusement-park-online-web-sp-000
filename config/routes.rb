Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new, :destroy]
  get '/signin', to: 'sessions#login'
  post 'sessions/create' 
  get '/logout', to: 'sessions#destroy'
  resources :rides, only: :create
  resources :attractions, except: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'


end
