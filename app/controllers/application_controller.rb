class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def require_login
    redirect_to '/' unless session[:user_id]
  end

  def require_admin
    redirect_to '/' unless current_user && current_user.admin?
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  
end
