Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  resources :users
  resources :attractions 

  get '/signin' => 'sessions#new'
  get '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
