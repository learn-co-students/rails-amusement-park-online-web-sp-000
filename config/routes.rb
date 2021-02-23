Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions
  resources :rides
  resources :users
  resources :sessions

  root "application#home"
  get "/signin", to: "users#new", as: "signin"
end
