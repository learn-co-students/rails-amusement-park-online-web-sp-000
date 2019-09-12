Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/signin', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :users, only: [:create, :index, :new, :show]
  resources :attractions, only: [:create, :edit, :index, :new, :show, :update]
  resources :rides, only: [:create, :index]

end
