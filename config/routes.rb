Rails.application.routes.draw do
  resources :rides
  
  resources :users

  get "/signin", to: "users#signin"
  post "/signin", to: "users#login"

  get '/logout' => 'users#logout'

  resources :attractions

  root to: "application#application"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
