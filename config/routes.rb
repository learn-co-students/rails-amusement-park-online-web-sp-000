Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#new"
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/logout' => 'users#logout', as: :logout
  post '/rides', to: 'rides#create'
end
