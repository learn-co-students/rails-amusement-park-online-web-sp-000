class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin_user
    current_user.admin
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:errors] = "Sorry! you must be logged in to view this page. Please log in or sign up."
      redirect_to root_path
    end
  end

  helper_method :current_user, :logged_in?, :admin_user

  # Methoda built in controllers don't permeate in ActionViews part of the code
  # Cannot call this in html.erb unless explicitly said by using helper_method

end
