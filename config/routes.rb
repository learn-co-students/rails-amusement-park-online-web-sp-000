Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :attractions

  root 'application#home'

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/signout', to: "sessions#destroy"
  post '/rides', to: "rides#create"
end
