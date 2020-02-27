Rails.application.routes.draw do
  resources :sessions
  root "welcome#home"
  #get '/users/new', to: 'users#new', :as => 'new_user'
  #post '/users', to: 'users#create'
  #get '/users/:id', to: 'users#show'
  delete '/users/:id', to: 'sessions#destroy', :as => 'logout'
  get '/signin', to: 'sessions#new', :as => 'signin'
  post '/signin', to: 'sessions#create'
  resources :users
  resources :rides
  resources :attractions
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
