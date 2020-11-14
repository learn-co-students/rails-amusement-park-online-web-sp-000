Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  post '/rides', to:"rides#create"
end
