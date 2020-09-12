Rails.application.routes.draw do
  get 'attractions/show'
  get 'attractions/new'
  get 'attractions/edit'
  root 'welcome#home'
  get '/signin' => 'sessions#new'
  post '/session' => 'sessions#create'
  delete '/session' => 'sessions#destroy'
  get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id', to: 'attractions#update'
  post '/attractions', to: 'attractions#create'
  post '/rides', to:"rides#create", as: 'rides'

  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# rails g controller Attractions show new edit --no-test-framework
