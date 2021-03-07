Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides
  resources :attractions
  get "signout", to: "sessions#destroy"
  post "signin", to: "sessions#create"
  get "signin", to: "users#login"
  root "users#login"
end
