Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users
  resources :sessions

  get '/signin' => 'sessions#new', as: '/'
  post '/login' => 'sessions#create', as: 'login'
  get '/login' => 'users#show'
  get '/' => 'users#new'
  post '/attractions/:id' => 'attractions#create'
  root 'welcome#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
