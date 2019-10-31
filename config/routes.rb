Rails.application.routes.draw do
  
  resources :users, only: [:new, :create, :index, :show]
  resources :attractions, only: [:create, :new, :edit, :update, :show, :index]

  get '/home', to: 'sessions#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  root 'application#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
