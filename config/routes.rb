Rails.application.routes.draw do
  root "welcome#home"
  resources :rides, only: [:new, :create]
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
