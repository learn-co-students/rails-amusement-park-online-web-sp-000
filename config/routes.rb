Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'users#new'
  resources :users
  resources :attractions
  resources :rides

  resources :admin do
    resources :attractions
  end

 
  get '/signin'=>'sessions#new'
  post '/signin'=>'sessions#create'
  post '/users/:id' => 'user#show'
  get '/users/:id' => 'user#show'
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  
end
