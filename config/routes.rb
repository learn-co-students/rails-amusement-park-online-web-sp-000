Rails.application.routes.draw do
  root 'welcome#home'
  get '/signin' => 'sessions#new'
  get '/attractions' => 'attractions#index'
  get '/attractions/:id' => 'attractions#show'
  post '/users/:id' => 'rides#go_on_ride'
  get '/attractions/new' => 'attractions#new'
  resources :users
  resource :sessions, only: [:create, :destroy]
  resource :attractions, only: [:show, :edit, :update]
  resources :rides, only: [:new, :create]
end
