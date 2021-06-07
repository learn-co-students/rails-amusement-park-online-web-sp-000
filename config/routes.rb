Rails.application.routes.draw do
  root "users#home"
  
  resources :attractions
  resources :users, only: [:new, :create, :show]
  resources :rides

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  post "/rides", to: "rides#update"



end
