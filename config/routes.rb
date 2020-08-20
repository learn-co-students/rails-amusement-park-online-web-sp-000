Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users

  get '/', to: "users#home", as: "root"

  get '/signin', to: "sessions#new"

  post '/signin', to: "sessions#create", as: 'sessions'

  get '/logout', to: "sessions#destroy", as: 'logout'

  resources :attractions

  post '/takeride', to: "attractions#takeride", as: 'takeride'
  
end
