Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"

  resources :users
  resources :attractions
  resources :rides, only: [:create]
  delete "/session" => "sessions#destroy"
  get "/signup" => 'users#new'
  get '/signin' => 'sessions#new' 
  resources :sessions, only: [:create]
end
