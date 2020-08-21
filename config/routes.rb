Rails.application.routes.draw do
  get '/signin', to: "sessions#new"
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
end
