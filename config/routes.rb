Rails.application.routes.draw do
  resources :attractions
  resources :users, only: [:new, :index, :show, :create, :edit, :update, :destroy]

  get '/signin', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
