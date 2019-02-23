Rails.application.routes.draw do
  resources :users
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
end
