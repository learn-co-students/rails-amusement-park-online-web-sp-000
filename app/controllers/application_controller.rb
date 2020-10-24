class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def home 
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to view this page"
      redirect_to '/'
    end
  end
  def logged_in?
    !!current_user
  end
  def current_user
    User.find_by(id: session[:user_id])
  end
end