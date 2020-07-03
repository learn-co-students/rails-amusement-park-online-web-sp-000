Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get "/", to: "application#home"
  get "/signin", to: "users#signin"
  post "/signin_user", to: "users#signin_user"
  post "/attractions/:id/ride", to: "attractions#ride"
  post "/users/delete", to: "users#destroy"
  root "application#home"
end
