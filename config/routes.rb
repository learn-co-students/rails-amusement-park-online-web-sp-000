Rails.application.routes.draw do
  root 'static#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
