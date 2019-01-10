Rails.application.routes.draw do
  resources :attractions
  resources :users
  get 'signin', to: 'sessions#new'
end
