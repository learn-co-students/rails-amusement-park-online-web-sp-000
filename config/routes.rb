Rails.application.routes.draw do
  root "users#home"
  resources :users, only: [:new, :show, :create, :edit, :update, :destroy]
  get '/signup' => 'users#new'
  get '/signin' => 'users#signin'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'

  resources :attractions
  post '/attractions/ride' => 'attractions#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
