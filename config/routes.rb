Rails.application.routes.draw do

  root 'users#new'
  
  resources :users, only: [:new, :create, :show]

  resources :attractions
  resources :rides
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  



end
