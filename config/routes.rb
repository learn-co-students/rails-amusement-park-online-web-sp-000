Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:new, :create, :show, :index, :edit, :update]
  root 'session#log_in'
  get 'signin' => 'session#log_in'
  post 'signin' => 'session#create'
  get 'logout' => 'session#log_out'
  post 'rides' => 'rides#take_ride'
end
