Rails.application.routes.draw do
  root to: 'welcome#home'
  resources :users, :attractions, :rides
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
