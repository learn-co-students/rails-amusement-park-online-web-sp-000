Rails.application.routes.draw do
  root 'users#new'
  resources :users, only:[:new, :create, :show, :edit]
  resources :attractions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :rides

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
