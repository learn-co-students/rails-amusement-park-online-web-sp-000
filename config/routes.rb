Rails.application.routes.draw do
  
  resources :users 
  resources :sessions
  resources :rides
  resources :attractions
  root 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/admin', to: 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
