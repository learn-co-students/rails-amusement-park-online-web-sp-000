Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: %i[new create show]
  resources :attractions, only: %i[index new create show]
  post 'attractions/:id/ride', to: 'attractions#ride', as: :ride
  get '/signin', to: 'session#signin', as: :signin
  post '/signin', to: 'session#load', as: :post_signin
  post '/logout', to: 'session#logout', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
