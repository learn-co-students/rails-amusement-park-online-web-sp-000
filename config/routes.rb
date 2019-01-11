Rails.application.routes.draw do
  resources :attractions
  resources :users
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
  post 'ride', to: 'attractions#ride'
  root 'users#new'
end
