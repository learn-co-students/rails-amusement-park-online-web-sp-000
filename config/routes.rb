Rails.application.routes.draw do

  resources :users
  resources :attractions

  root 'welcome#home'
  get '/rides/create' => 'rides#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/logout' => 'sessions#destroy'
  post '/rides' => 'rides#create'
end
