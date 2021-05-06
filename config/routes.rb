Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions, only: [:new, :create, :edit, :show, :update]
  resources :users, only: [:new, :create, :show, :update]
  get '/', to: "users#index"
  get '/signin', to: "users#signin"
  post '/signin', to: "users#verify_signin"
  root "users#index"
  delete '/logout', to: "users#destroy"

  get '/attractions', to: "attractions#index"

end
