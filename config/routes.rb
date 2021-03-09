Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides
  namespace :admin do
    resources :attractions
  end
  resources :attractions
  get "signout", to: "sessions#destroy"
  post "signin", to: "sessions#create"
  get "signin", to: "users#login"
  get "take_ride", to: "rides#take_ride", as: "take_rides"
  post "take_ride/:ride_id", to: "rides#take_ride", as: "take_ride"
  root "users#login"
end
