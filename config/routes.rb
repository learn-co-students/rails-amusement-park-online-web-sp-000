Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get 'signup' => 'users#new'
   post 'signup' => 'users#create'
  get 'signin'=> 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'logout' => 'sessions#logout'
  root 'welcome#index'

  #resources :attractions
  post '/attractions/ride' => 'attractions#ride'

  resources :users
  resources :attractions, except: [:destroy]
  resources :rides, only: [:create]
end
