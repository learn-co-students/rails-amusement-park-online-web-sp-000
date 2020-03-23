Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
end
