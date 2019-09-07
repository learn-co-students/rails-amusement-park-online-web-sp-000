Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/signin', to: "sessions#signin"
  post '/session', to: "sessions#create"
  get '/signout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show, :update]
  resources :attractions, only: [:index, :show]
  resources :rides, only: [:create]
end
