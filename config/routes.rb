Rails.application.routes.draw do
  
  resources :users
  resources :sessions
  resources :rides
  root 'application#home'

  get '/signin' => 'users#new'
  post '/signin' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
