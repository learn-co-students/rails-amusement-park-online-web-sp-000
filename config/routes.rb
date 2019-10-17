Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions
  resources :rides
  get 'signin' => "sessions#new"
  post 'sessions' => "sessions#create"
  get 'signout' => "sessions#destroy"
  root 'sessions#index'
end
