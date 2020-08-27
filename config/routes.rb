Rails.application.routes.draw do
  root to: 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'application#home'

  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  
  get 'logout', to: 'session#destroy'
  
  resources :users
end
