Rails.application.routes.draw do
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin' => 'sessions#new'
  get '/sessions' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :users, only: [:new, :create, :index, :show]
  resources :attractions, except: [:destroy]
  resources :rides, only: [:new, :create]
end
