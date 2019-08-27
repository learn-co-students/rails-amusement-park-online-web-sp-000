Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users

  root 'welcome#hello'
  get '/signin', to: 'users#new'
  post '/signin', to: 'users#create'
#  delete '/signout', to: 'sessions#destroy'

#  get    '/login',   to: 'sessions#new'
#  post   '/login',   to: 'sessions#create
end
