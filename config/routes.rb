Rails.application.routes.draw do
  root to: 'application#home'

  resources :users

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create', as: 'session'

  get '/attractions/new', to: 'attractions#new'
  post '/attractions', to: 'attractions#create'

  get '/attractions', to: 'attractions#index'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'

  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id', to: 'attractions#update'

  post '/rides', to: 'rides#create'

  delete '/signout', to: 'sessions#destroy'
 
end
