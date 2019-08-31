Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  resources :rides
  resources :attractions
  resources :users

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
