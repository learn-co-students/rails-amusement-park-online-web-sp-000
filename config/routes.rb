Rails.application.routes.draw do
  resources :users, only: %i[new]
  get '/signin', to: 'session#login'
  post '/signout', to: 'session#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
