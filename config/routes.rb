Rails.application.routes.draw do

  get 'rides/create'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  resources :users
  resources :attractions
  resources :rides
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
  post 'takeride', to: 'users#take_ride'
end
