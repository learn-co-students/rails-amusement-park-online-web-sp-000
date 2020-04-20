Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :index, :edit, :show, :update]
  resources :rides, only: [:create]
  root "sessions#home"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
