class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :admin?, :signed_out?

  def home
    render '/home'
  end

  def signed_out?
    return true if !!current_user != true
  end

  def signed_in?
    !!current_user
  end

  def admin?
     !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
