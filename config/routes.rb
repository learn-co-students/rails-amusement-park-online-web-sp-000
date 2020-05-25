Rails.application.routes.draw do
  resources :users
  resources :attractions, :only => [:index, :show, :new, :create, :edit, :update]
  root "welcome#home"
  get '/signin', :to => "session#new"
  post '/signin', :to => "session#signin"
  post '/logout', :to => "session#destroy"
  post '/rides', :to => "rides#create"
end
