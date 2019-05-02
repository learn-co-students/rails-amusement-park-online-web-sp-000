Rails.application.routes.draw do
  root 'users#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users

  resources :attractions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
