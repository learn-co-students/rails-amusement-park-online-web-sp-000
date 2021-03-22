class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_login

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
        flash[:message] = "Please log in to be able to enjoy the Amusement Park Rides."
        redirect_to login_url
    end
  end

end
