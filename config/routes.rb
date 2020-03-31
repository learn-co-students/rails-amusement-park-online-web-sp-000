Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
 
  resources :users, only: [:new, :create, :show]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signin', to: 'sessions#destroy'

end
