Rails.application.routes.draw do
  root 'application#index'

  resources :users

  resources :attractions

  patch '/attractions/:id/ride' => 'attractions#ride'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signin' => 'sessions#delete'
end
