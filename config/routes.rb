Rails.application.routes.draw do
  root "application#home"

  get '/signin', to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :users
  resources :attractions, except: :destroy
  resources :rides, only: [:create]
end
