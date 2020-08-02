Rails.application.routes.draw do
  # get 'static/home'
  get "/signin", to: 'sessions#new'
  get "/attractions/new", to: 'attractions#new'
  post "/attractions/new", to: 'attractions#create'
  post "/signin", to: 'sessions#create'
  post "/users/:id", to: 'attractions#show'
  resources :users
  resources :sessions
  resources :attractions do 
    post :user_goes_on_ride, on: :member
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
end
