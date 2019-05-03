Rails.application.routes.draw do
  get '/signin', to: 'sessions#signin'
  get '/signout', to: 'sessions#signout'
	root 'welcome#home'
	resources :rides
  resources :attractions
	resources :users
	resources :sessions 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
