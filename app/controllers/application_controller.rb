class ApplicationController < ActionController::Base
    # enable :sessions
    # set :session_secret, "secret_boi"

  # protect_from_forgery with: :exception

  def application
  	render "layouts/application"
  end

end
