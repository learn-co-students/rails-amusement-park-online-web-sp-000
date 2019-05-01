Rails.application.routes.draw do
  resources :users#, :only => [:new, :show]
  resources :attractions
  get '/signin', :to => 'sessions#new'
  post '/signin', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  root :to => 'users#new'
end
