Rails.application.routes.draw do
  root 'users#new'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#signin'
  resources :rides
  resources :users
  resources :attractions
  get '/logout', to: 'users#logout'
  post '/attractions/show/:id', to: 'attractions#show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
