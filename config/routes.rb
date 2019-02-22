Rails.application.routes.draw do
  post 'rides/create', to:"ride#create"
  root 'static#index'
  resources :users, :attractions
  post "users/new", to:"users#create"
  get "/signin", to: "sessions#new"
  post "sessions/new", to:"sessions#create"
  get "sessions/destroy", to:"sessions#destroy"
  post "attractions/new", to:"attractions#create"

end
