Rails.application.routes.draw do
  resources :attractions
  resources :users
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  root 'users#new'
end
