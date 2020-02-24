Rails.application.routes.draw do


root to: "users#index"

resources :users, :only => [:new, :create, :show]
resources :attractions, :only => [:index, :new, :create, :edit, :update, :show]
patch 'attractions/:id', to: 'attractions#update'

post '/rides' => 'rides#create'
get '/signin' => 'sessions#new'
post '/sessions' => 'sessions#create'
get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
