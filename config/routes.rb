Rails.application.routes.draw do
  resources :attractions
  resources :users
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create]
  
  resources :rides, only: [:create]
  root 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
