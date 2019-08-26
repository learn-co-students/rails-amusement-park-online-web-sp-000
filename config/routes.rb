Rails.application.routes.draw do
  root 'static#index'
  get '/signin', to: 'users#new'
  post '/signin', to: 'users#create'
  delete '/signout', to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
