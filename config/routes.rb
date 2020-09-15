Rails.application.routes.draw do
  get '/', to: 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  
  get 'logout', to: 'session#destroy'
  
  resources :users
  resources :attractions
  resources :rides
end
