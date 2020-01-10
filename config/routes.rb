Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :rides
  resources :attractions

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#create_session'
  get '/logout', to: 'users#logout'

  root 'rides#index'
end
