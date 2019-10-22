Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  root 'users#new'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/rides', to: 'attractions#ride'
  resources :attractions
end
