Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
  resources :rides, only: [:create]
  get 'signin' => "sessions#new"
  get 'logout' => "sessions#destroy"
  root "welcome#home"
end
