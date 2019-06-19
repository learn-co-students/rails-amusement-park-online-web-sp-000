Rails.application.routes.draw do
  root 'static#home'
  resources :users, only: [:new, :show, :create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'
end
