Rails.application.routes.draw do
  resources :users
  resources :attractions
  root 'users#new'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  post '/session', to: 'sessions#update'
  post '/attractions/:id', to: 'attractions#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
