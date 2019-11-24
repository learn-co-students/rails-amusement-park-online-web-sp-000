Rails.application.routes.draw do
  
  root "welcome#index"
    resources :users
    resources :attractions

    get '/signin' => "sessions#new"
    post '/signin' => "sessions#create"
    delete '/signout' => "sessions#sign_out"

     post '/ride' => "rides#new"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
