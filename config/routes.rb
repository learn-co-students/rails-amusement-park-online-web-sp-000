Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id', to: 'users#show', as: 'users_show'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin' => 'sessions#create'
  post '/logout' => 'users#destroy'
  root :to => "static#home"

  # resources :users
  # resources :sessions, only: [:create]
  # resources :attractions
  # resources :rides
  # get '/signin', to: "sessions#new"
  # get '/signout', to: "sessions#destroy"
  # root :to => "static#home"
end
