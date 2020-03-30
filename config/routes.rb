Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to: 'welcome#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

end
