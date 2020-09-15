Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users/new', to: 'users#new'
  resources :users
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#signin'
end
