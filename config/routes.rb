Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'sessions#welcome'

  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  post '/destroy', to: 'sessions#destroy'

 
  resources :attractions
  resources :users, only: [:new, :create, :show]
  post '/rides', to: 'rides#create'


end
