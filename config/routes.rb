Rails.application.routes.draw do
  resources :attractions
  resources :users, only: [:new, :create, :show]
  root "static_pages#home"
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
