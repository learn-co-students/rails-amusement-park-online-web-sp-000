Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions
  get '/signin', to: 'session#new'
  post '/sessions', to: 'session#create'
  get '/logout', to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
