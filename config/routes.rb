Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users
  resources :attractions

  get '/signin', to: 'users#login'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
