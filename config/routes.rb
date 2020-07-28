Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users
  resources :attractions
  get '/signin', to: 'users#signin'
  post '/sign_user_in', to: 'users#sign_user_in'
  get '/logout', to: 'users#logout'
end
