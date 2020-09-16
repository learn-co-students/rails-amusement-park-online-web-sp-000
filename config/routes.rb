Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'users#new'
  resources :users

 
  get '/signin'=>'sessions#new'
  post '/signin'=>'sessions#create'
  post '/users/:id' => 'user#show'
  get '/users/:id' => 'user#show'
 
 

  
end
