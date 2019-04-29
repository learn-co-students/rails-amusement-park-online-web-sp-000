Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'welcome#home'

   get '/signup', to: 'users#new'
   post '/signup', to: 'users#create'

   get '/login', to: 'sessions#new'
   post '/sessions', to: 'sessions#create'
   post '/logout', to: 'sessions#destroy'

   resources :users
   resources :attractions
   resources :rides, only: [:create]

end
