Rails.application.routes.draw do
  root 'application#index'
  get '/signin' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  post '/signin' => 'sessions#create'
  resources :users
  resources :attractions
  resources :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
