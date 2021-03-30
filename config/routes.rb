Rails.application.routes.draw do
  root 'static#home'
  
  resources :attractions
  resources :users

  get '/signin' => 'session#new'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'

  post '/rides' => 'rides#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
