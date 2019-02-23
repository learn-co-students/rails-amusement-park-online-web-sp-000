Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resources :attractions
  resources :rides

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
