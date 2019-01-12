Rails.application.routes.draw do
  resources :attractions
  resources :users
  get 'signin', to: 'sessions#new', as: :signin_path
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: :signout_path
  post 'ride/:id', to: 'rides#create', as: :ride
  root 'users#new' # should go to some index or something?
end
