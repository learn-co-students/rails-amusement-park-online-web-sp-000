Rails.application.routes.draw do
  root 'application#hello'
  get '/signin' => 'sessions#new'
  post '/sigin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/rides' => 'rides#create'
  resources :users
  resources :rides
  resources :attractions
end
