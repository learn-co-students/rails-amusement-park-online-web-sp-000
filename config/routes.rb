Rails.application.routes.draw do
  root 'users#new'
  resources :users
  get '/signin', to: 'users#new'
end
