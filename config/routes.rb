Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions  do 
      post '/ride', to: "rides#create"
   end
#  "/attractions/:id/rides"
  # post '/attraction/ride', to: "rides#create"

  root "welcome#home"

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"



  
end
