Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users
  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login'
  post '/logout', to: 'users#destroy'
  post '/rides', to:"rides#create"

  resources :attractions 
  
end
