Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'
  resources :users, :attractions

  resources :rides, only: [:create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/destroy', to: 'sessions#destroy'

end
