Rails.application.routes.draw do
 
  
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index,:new, :create, :show, :edit, :update]
  resources :rides, only: [:create]
  
  root 'sessions#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
