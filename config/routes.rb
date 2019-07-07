Rails.application.routes.draw do
  root 'application#welcome'
  get 'signin' => 'sessions#new'
  post 'logout'=> 'sessions#destroy'

  resources :attractions, only:[:new, :index, :create, :show, :edit, :update]
  resources :users, only: [:create, :show, :new]
  resources :sessions, only: :create
  resources :rides, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
