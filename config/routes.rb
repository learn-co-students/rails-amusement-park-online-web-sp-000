Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#home'
  resources :users
  get '/signin', to: 'sessions#sign_in', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/sessions/', to: 'sessions#destroy'
  get '/attractions', to: 'attractions#index'
  get '/attractions/id', to: 'attractions#show'

end
