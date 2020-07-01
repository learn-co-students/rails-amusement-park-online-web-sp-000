Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  # form to log the user in 
  get '/signin', to: 'sessions#new'

  # log the user in 
  post '/sessions', to: 'sessions#create'

  # log out, make this post in real life but tests require get
  # post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
   
  root 'static#home'

  resources :users, only: [:show, :new, :create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
end
