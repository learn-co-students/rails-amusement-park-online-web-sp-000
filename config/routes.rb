Rails.application.routes.draw do
  get 'signin' => 'sessions#signin'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#signout'
  post 'takeride' => 'users#takeride'
  
  resources :attractions
  resources :users
  resources :sessions, only:[:create]

  root :to => 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
