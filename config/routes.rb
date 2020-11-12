Rails.application.routes.draw do
  resources :attractions# ,only: [:index,:edit,:show, :update, :delete,:new ,:create]
  # patch 'attractions/:id/edit' => 'attractions#update'
  resources :rides
  resources :users
  root :to => 'users#home'
    #  resources :sessions, only: [:new, :create, :destroy]
  #  delete '/session', to: 'sessions#destroy'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
