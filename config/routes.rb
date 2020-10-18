Rails.application.routes.draw do
  root to: 'application#home'
  resources :rides
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/attractions/:id', to: 'rides#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
