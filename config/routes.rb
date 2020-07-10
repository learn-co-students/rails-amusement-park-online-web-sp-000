Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions
  resources :users
  get 'signin', to: 'sessions#new', as: :signin
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: :signout
  post 'ride/:attraction_id', to: 'rides#create', as: :ride
  # root 'users#new' # should go to some index or something?
  root 'attractions#index'
end
