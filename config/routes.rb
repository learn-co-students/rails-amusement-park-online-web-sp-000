Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :attractions
  # resources :users, only: [:new,:show]
  resources :users
  resources :attractions
  resources :rides

  root 'application#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
end
