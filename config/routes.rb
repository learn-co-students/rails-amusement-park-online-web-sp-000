Rails.application.routes.draw do
  root 'users#new'
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
end
