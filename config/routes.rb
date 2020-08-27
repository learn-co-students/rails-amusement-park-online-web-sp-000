Rails.application.routes.draw do
  root 'static#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/session' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides, only: [:new, :create]
end
