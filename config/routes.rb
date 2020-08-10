Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'static#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
