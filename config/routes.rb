Rails.application.routes.draw do
  get "/signin", to: 'sessions#new'
  post "/signin", to: 'sessions#create'
  resources :users
  resources :sessions
  resources :attractions
  resources :attractions do 
    post :user_goes_on_ride, on: :member
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
end
