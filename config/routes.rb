Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create', as: 'submit_signin'
  match '/logout' => 'sessions#destroy', via: [:get, :post]

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
end
