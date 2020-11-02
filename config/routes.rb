Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users
  # get '/users/new', to: 'users#new', as: 'new_user'
  root 'static#home'
 
  resources :attractions
  resources :rides
  resources :session
  resources :static

  
  get '/signin', to: 'session#new', as: 'signin'
  
  
end
