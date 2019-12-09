Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users
  resources :sessions
  resources :preferences

  get '/signin' => 'sessions#new', as: '/'
  post '/login' => 'sessions#create', as: 'login'
  get '/login' => 'users#show'
  get '/' => 'users#new'
  root 'welcome#home'

  namespace :admin do 
    resources :preferences, only: [:index]
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
