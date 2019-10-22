Rails.application.routes.draw do
  resources :users,:attractions, :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#login'

  get '/logout', to: 'sessions#destroy'
end
