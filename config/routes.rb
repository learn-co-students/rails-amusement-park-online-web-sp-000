Rails.application.routes.draw do
  
  root 'users#welcome'


  get '/signin' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  

  resources :users, :only => [:new, :show, :create, :edit, :update]
  resources :attractions
  post '/attractions/ride' => 'attractions#ride'
end
