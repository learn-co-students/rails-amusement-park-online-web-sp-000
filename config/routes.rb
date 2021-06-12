Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get '/users/new', to: 'users#new'
  post '/users/', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/signin' , to: 'users#signin'
  post '/signin', to: 'sessions#signin'
  post '/logout', to: 'sessions#destroy'
  get '/attractions/', to: 'attractions#index'
  get '/attractions/new', to: 'attractions#new'
  post '/attractions/', to: 'attractions#create'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id', to: 'attractions#update'#, as: 'attraction'
  post '/attractions/:id/take_ride', to: 'attractions#take_ride', as: 'take_ride'
end
