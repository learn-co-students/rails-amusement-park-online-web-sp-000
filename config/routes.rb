Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # resources :attractions
  # root :to => "users#new"
  # resources :sessions

  resources :users, only: [:new, :create, :show, :edit, :update]
  root 'users#new'

  resources :attractions
  resources :rides


  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post "/signout", to: 'sessions#destroy', as: 'logout'
end
