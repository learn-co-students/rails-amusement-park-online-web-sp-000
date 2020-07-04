Rails.application.routes.draw do
  root 'static#home'
  resources :users, :attractions
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'ride', to: 'rides#create'  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
