class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :ride_message

  def current_user
    User.find_by( id: session[:user_id])
  end

  def ride_message
    session[:ride_message]
  end
end
