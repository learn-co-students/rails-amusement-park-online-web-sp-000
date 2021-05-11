Rails.application.routes.draw do
  resources :users, :attractions
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#verify_signin'
  get '/logout', to: 'users#logout'

  post '/attractions/:id/ride', to: 'attractions#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#welcome"
end
