Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'users#index'
	resources :users, only: [:new, :create, :show]
	resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
	resources :rides, only: [:create]
	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
end
