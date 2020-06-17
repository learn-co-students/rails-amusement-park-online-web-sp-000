Rails.application.routes.draw do
  
  resources :attractions

  root 'static#home'

  resources :rides, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create, :show]
  get '/signin', to: 'session#new' #, as: 'signin'
  post '/session', to: 'session#create' #, as: 'session'
  get '/signout', to: 'session#destroy'
end
