Rails.application.routes.draw do

  root 'users#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users

  namespace :admin do
    resources :users
  end

  resources :attractions

end
