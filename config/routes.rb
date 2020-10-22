Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
    #homepage
    #signup
    resources :users
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
     #user_show
     get '/users/:id', to: 'users#show'
    #login
    get '/signin', to: 'sessions#new' 
    post '/signin', to: 'sessions#create' 

    #logout
    get '/signout', to: 'sessions#destroy' 

   

    #attractions_path
    resources :attractions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    #attraction_show_path
    #new_ride_path
    post '/rides', to: 'rides#create'

  

end
