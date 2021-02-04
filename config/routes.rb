Rails.application.routes.draw do
  root 'welcome#home'
  get '/users/new', to: 'users#new'
  get '/users', to:'users#index'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  get '/attractions', to: 'attractions#index'
  get '/signin', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session/', to: 'session#destroy'
  get '/attractions/new', to: 'attractions#new'
  get '/attractions/:id', to: 'attractions#show'
  get '/attractions/:id/edit', to: 'attractions#edit'
  patch '/attractions/:id', to: 'attractions#update'
  post '/attractions', to: 'attractions#create'
  post '/rides', to:"rides#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
