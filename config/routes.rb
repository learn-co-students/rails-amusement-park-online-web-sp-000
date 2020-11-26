Rails.application.routes.draw do
  root 'application#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]

  resources :users, only: [:new, :show, :create]

  resources :rides, only: [:create]
end