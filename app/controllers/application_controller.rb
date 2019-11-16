class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:user_id]
  end

  def require_login
    redirect_to root_path unless session[:user_id]
  end

  def require_admin
    @user = User.find_by_id(session[:user_id])
    redirect_to root_path unless @user.admin
  end

end
