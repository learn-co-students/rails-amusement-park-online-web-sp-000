Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :attractions
  root to: 'users#index'
  get '/signin', to: 'sessions#signin'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  post '/attractions/:id', to: 'attractions#ride'
end
