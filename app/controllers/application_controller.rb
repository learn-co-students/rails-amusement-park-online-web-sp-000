class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_login
    redirect_to root_path unless logged_in?
  end
  
  def log_user_in(user)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end
end
