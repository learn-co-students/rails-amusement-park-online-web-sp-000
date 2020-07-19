Rails.application.routes.draw do

  root to: 'users#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#loggedin'

  # get '/logout', to: 'users#delete'
  delete '/logout', to: 'users#destroy'

  resources :rides
  resources :attractions

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
