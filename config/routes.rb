Rails.application.routes.draw do


root to: "sessions#index"

resources :users, :only => [:new, :create, :show]
resources :attractions, :only => [:new, :create, :show]
get '/login' => 'sessions#new'
post '/sessions' => 'sessions#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
