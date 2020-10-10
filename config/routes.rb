Rails.application.routes.draw do
  
  resources :users
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  post '/signout' => 'sessions#destroy'
  root 'welcome#home'
  post '/rides', to:"rides#create", as: 'rides'

end
