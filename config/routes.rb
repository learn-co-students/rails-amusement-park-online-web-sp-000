Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#home'
  resources :users
  post '/signout' => 'sessions#destroy'
end
