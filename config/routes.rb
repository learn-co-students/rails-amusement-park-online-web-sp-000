Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users
  root 'static#home'
  
  
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
