Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'application#home', as: 'root'

  get '/signin' => 'sessions#new', as: 'sign_in'

  get '/logout' => 'sessions#destroy', as: 'destroy'

  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show, :create, :new, :edit, :update]
  resources :rides, only: [:create]
  resources :sessions, only: [:create]
end
