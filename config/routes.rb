Rails.application.routes.draw do
  resources :attractions
  resources :users, only: [:new, :index, :show, :create, :edit, :update, :destroy]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/', to: 'users#new'
  get '/logout', to: 'users#destroy'
  get '/attractions', to: 'attractions#index'
  post '/rides', to:"rides#create", as: 'rides'
  get '/attractions/new', to: "attractions#new"
  get '/attractions/:id/edit', to: 'attractions#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
