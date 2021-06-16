Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  
  resources :users, only: [:new, :create, :show]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
 delete '/signout' => 'sessions#destroy'
  post '/rides' => 'rides#create'

  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
end
