Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "application#home"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  resources :attractions
  resources :users
  resources :rides

end
