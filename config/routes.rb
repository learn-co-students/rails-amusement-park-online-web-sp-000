Rails.application.routes.draw do
  root 'welcome#show'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :attractions
  resources :rides
  resources :users

  namespace :admin do
    resources :attractions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
