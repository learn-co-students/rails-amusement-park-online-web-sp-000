Rails.application.routes.draw do

  root 'application#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  resources :users
=begin
  get 'users/new'
  get 'users/create'
  get 'users/show'
=end

  resources :sessions
=begin
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  post '/session', to: 'sessions#update'
  post '/attractions/:id', to: 'attractions#ride'
=end

  resources :rides
=begin
  get 'rides/new'
  get 'rides/create'
=end

  resources :attractions
=begin
  get 'attractions/index'
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/show'
  get 'attractions/edit'
  get 'attractions/update'
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
