Rails.application.routes.draw do
  resources :rides, only: [:new, :show, :create]
  resources :attractions, only: [:new, :show, :create, :index, :edit, :update]
  resources :users, only: [:new, :show, :create]

  root :to => 'users#new'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

end
