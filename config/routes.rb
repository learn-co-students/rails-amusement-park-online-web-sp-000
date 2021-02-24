Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions
  resources :rides
  resources :users, only: [:index, :new, :create, :show, :update]
  resources :sessions, only: [:new, :create]

  root "application#home"
  get "/signin", to: "sessions#new", as: "signin"
  delete "/logout", to: "sessions#destroy", as: "logout"
end
