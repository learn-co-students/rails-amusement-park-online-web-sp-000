Rails.application.routes.draw do
  get 'attractions/index'
  root 'users#new'
  resources :users
  get '/signin', to: 'sessions#signup'
  resources :sessions, only: [:create, :destroy]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  post '/attractions/:id', to: 'attractions#cost'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
