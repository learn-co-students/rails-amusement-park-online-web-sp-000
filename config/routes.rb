Rails.application.routes.draw do
  resources :attractions
  resources :users
  get 'signin', to: 'sessions#new', as: :signin_path
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: :signout_path
  post 'ride/:attraction_id', to: 'rides#create', as: :ride
  root new_user_path # should go to some index or something?
end
