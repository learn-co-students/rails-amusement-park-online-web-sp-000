Rails.application.routes.draw do
  root 'application#index'
#   get '/signup' => 'users#new'
# post '/signup' => 'users#create'
get '/signin' => 'sessions#new'
post '/signin' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:new, :show, :create]

resources :rides, only: [:create]

namespace :admin do
  resources :attractions, only: [:index, :show, :new]
  # resources :users, only: [:new, :show, :create, :destroy]
end


end