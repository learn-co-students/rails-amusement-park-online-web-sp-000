Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions
  resources :rides
    get '/signin', to: 'sessions#new', as: 'signin'
    post '/signin', to: 'sessions#create'

    get '/logout', to: 'sessions#destroy'

  resources :welcome, :only => [:index]
  root :to => 'welcome#index'
end
