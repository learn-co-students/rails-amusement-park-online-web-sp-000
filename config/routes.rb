Rails.application.routes.draw do
  # get 'static/home'
  resources :users
  resources :sessions
  resources :attractions
  get "/signin", to: 'sessions#new'
  post "/signin", to: 'sessions#create'
  post "/users/:id", to: 'attractions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
end
