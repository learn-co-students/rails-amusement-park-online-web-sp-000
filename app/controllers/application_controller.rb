class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to signin_path unless session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
  
end
