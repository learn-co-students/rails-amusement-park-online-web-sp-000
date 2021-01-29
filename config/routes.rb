Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :users
  resources :attractions
  resources :rides, only: [:create]

  get '/signup' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
