Rails.application.routes.draw do
  root 'static_pages#home'
  resources :attractions
  resources :rides
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/session', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
