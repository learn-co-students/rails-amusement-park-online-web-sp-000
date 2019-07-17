Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :attractions

  resources :attractions do
    resources :rides, only: [:create]
  end
  
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  root 'welcome#welcome_page'
end
