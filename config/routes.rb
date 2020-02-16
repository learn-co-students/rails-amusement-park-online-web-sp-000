Rails.application.routes.draw do
  root "users#welcome"
  resources :users
  get "/signin" => "sessions#new"
  post "/signin" => 'sessions#create'
  get "/logout" => 'sessions#destroy'
  resources :attractions
  post "/rides" => 'rides#create', as: 'rides'
end
