Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/users/new', to: 'users#new', as: 'signup'
  resources :users, only: [:index, :create, :show]
  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'users#logout', as: 'signout'
  get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  post '/attractions', to: 'attractions#create'
  patch '/attractions/:id', to: 'attractions#update' 
  post '/rides', to: "rides#create", as: 'rides'
end

