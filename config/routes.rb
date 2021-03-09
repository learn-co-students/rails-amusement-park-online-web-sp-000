Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions

  get '/signin', to: "users#signin"
  post '/signin', to: "users#login"

  get '/logout', to: "sessions#logout"

  root to: "users#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
