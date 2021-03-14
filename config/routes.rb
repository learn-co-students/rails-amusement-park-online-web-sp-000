Rails.application.routes.draw do
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/users/:id' => 'users#show'
  resources :users 
  resources :rides
  resources :attractions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
