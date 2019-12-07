Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'users#new'
  get '/signin' => 'users#signin'
  resources :users, only: [:new, :create, :show]

end
