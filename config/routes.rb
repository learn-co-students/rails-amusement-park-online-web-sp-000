Rails.application.routes.draw do
  root 'application#home'
  resources :users
  resources :rides
  resources :attractions
end
