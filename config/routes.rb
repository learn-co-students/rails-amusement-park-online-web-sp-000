Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  resources :users
  resources :attractions
  get '/signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/rides' => 'rides#create'
  delete '/signout' => 'sessions#destroy'
end
