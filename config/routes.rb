Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/users/new' => 'users#new'
  resources :users
  root 'application#index'
  get '/signin' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :attractions
  post '/ride' => 'rides#create'
end
