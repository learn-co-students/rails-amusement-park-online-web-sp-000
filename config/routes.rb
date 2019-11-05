Rails.application.routes.draw do
  
  resources :rides, only: [:new, :create]
  resources :users, only: [:new, :create, :index, :show]
  resources :attractions, only: [:create, :new, :edit, :update, :show, :index]

  get '/home', to: 'sessions#show'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  root 'application#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
