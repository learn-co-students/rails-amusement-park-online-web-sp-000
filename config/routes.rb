Rails.application.routes.draw do
  get 'attractions/new'
  get 'attractions/show'
  get 'attractions/edit'
  get 'attractions/index'
  root 'welcome#home'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :attractions, only: [:new, :create, :index, :show, :edit, :update]
  resources :rides, only: [:create]
  get 'signin' => "sessions#new"
  get 'logout' => "sessions#destroy"

end
