Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  resources :users
  resources :sessions
  resources :rides
  resources :attractions
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  # get '/attractions', to: 'attractions#index'
  # get '/attractions/new', to: 'attractions#new'
  # get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  # post '/attractions/:id', to: 'rides#create'
  # get '/attraction/edit', to: 'attractions#edit'
  # delete '/attractions/:id', to: 'attractions#destroy'
end
