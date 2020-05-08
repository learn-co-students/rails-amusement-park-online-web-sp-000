Rails.application.routes.draw do
  post 'rides/create'
  resources :users
  resources :attractions
  resources :rides
  get 'users/new'
  get 'users/show'
  post 'users/create'
  
  get '/signin' => 'sessions#new'
  post '/signin' =>'sessions#create'
  get '/signout' => 'sessions#destroy'
  get 'sessions/show'
  root 'attractions#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
