class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id] != nil && session[:user_id] != ""
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def admin_check
    current_user
    @user.admin?
  end 

end
