Rails.application.routes.draw do
     root 'users#index'

    get '/signin', to: 'sessions#new'
    post '/signin', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    
    resources :users
    resources :attractions
    resources :rides
    resources :sessions, only: [:new, :create, :destroy]
end

