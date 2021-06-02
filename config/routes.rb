Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users
  root 'users#welcome'
  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
