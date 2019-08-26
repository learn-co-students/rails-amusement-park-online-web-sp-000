Rails.application.routes.draw do
  root 'static#index'
  get '/signin', to: 'static#signin'
  post '/login', to: 'static#login'

  resources :rides
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
