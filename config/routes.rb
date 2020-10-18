Rails.application.routes.draw do
  root "static#home"
  resources :users
  resources :attractions
  get "/signup" => 'users#new'
  get '/signin' => 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
