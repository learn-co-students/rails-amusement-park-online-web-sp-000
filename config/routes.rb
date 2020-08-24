Rails.application.routes.draw do
  # get 'attractions/index'
  get '/signin', to: "sessions#new"
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # get '/attractions', to: 'attractions#index'
  # get '/attractions/:id', to: 'attractions#show'
  post '/go_on_ride', to: 'users#go_on_ride'
  resources :attractions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
end
