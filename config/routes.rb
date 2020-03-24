Rails.application.routes.draw do
  root 'welcome#home'
  get '/signin' => 'sessions#new'
  get '/attractions' => 'attractions#index'
  get '/attractions/new' => 'attractions#new'
  get '/attractions/:id' => 'attractions#show'
  post '/users/:id' => 'rides#go_on_ride'

  post '/attractions' => 'attractions#create'
  resources :users
  resource :sessions, only: [:create, :destroy]
  resources :attractions, only: [:show, :edit, :update]
  resources :rides, only: [:new, :create]
end
