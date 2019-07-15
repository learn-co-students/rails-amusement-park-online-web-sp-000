class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    current_user.admin?
  end
end
