Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :users
  	resources :attractions

  	get '/signup' => 'users#new'
  	patch '/users/:id' => 'users#update'

	get '/signin' => 'sessions#new'

	post '/signin' => 'sessions#create'

	post '/logout' => 'sessions#destroy'

	root 'welcome#home'

	get '/attractions' => 'attractions#index'

	post '/ride/:id' => 'rides#takeride'

end
