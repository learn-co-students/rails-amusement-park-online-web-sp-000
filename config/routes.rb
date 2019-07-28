Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/signup' => 'users#new'
  resources :users, only:[:new, :create, :show]
  resources :attractions, only:[:index]
  root :to => "static#home"
  get "/signin", to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/logout', to: "sessions#destroy" 
end

