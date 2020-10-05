Rails.application.routes.draw do
  root "static#home"

  resources :users, only: [:show, :new, :create]
  resources :attractions
  resources :rides, only: [:create]

  get "/signin", to: "sessions#new", as: "login"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
