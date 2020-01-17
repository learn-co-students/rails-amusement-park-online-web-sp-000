Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'users#index'
  get '/users/logout', :to => 'sessions#destroy'
  resources :users
  patch '/attractions/:id/takeride', :to => 'attractions#takeride'
  resources :attractions
  get '/signin', :to => 'sessions#new'
  post '/sessions', :to => 'sessions#create'
end
