Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # it "on log in, successfully adds a session hash" do
  #   create_standard_user
  #   visit '/signin'

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'


end
