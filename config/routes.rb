Rails.application.routes.draw do

  root to: 'users#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to:'sessions#signin'
  get '/logout', to:'sessions#logout'

  resources :users, :attractions, :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#                     Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        users#home
#                    signin GET    /signin(.:format)                                                                        sessions#new
#                           POST   /signin(.:format)                                                                        sessions#signin
#                    logout GET    /logout(.:format)                                                                        sessions#logout
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#               attractions GET    /attractions(.:format)                                                                   attractions#index
#                           POST   /attractions(.:format)                                                                   attractions#create
#            new_attraction GET    /attractions/new(.:format)                                                               attractions#new
#           edit_attraction GET    /attractions/:id/edit(.:format)                                                          attractions#edit
#                attraction GET    /attractions/:id(.:format)                                                               attractions#show
#                           PATCH  /attractions/:id(.:format)                                                               attractions#update
#                           PUT    /attractions/:id(.:format)                                                               attractions#update
#                           DELETE /attractions/:id(.:format)                                                               attractions#destroy
#                     rides GET    /rides(.:format)                                                                         rides#index
#                           POST   /rides(.:format)                                                                         rides#create
#                  new_ride GET    /rides/new(.:format)                                                                     rides#new
#                 edit_ride GET    /rides/:id/edit(.:format)                                                                rides#edit
#                      ride GET    /rides/:id(.:format)                                                                     rides#show
#                           PATCH  /rides/:id(.:format)                                                                     rides#update
#                           PUT    /rides/:id(.:format)                                                                     rides#update
#                           DELETE /rides/:id(.:format)                                                                     rides#destroy
