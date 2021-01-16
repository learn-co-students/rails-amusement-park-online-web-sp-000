Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signin' => 'session#new'
  post '/signin' => 'session#create'
  delete '/logout' => 'session#destroy'
  root 'static#home'

  

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]
end
