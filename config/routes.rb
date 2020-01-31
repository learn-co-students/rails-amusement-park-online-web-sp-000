Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:new, :show]
  resources :attractions
  get '/signin', :to => 'sessions#new'
  post '/signin', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  root :to => 'users#new' 
end
