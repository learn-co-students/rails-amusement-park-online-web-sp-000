class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      redirect_to root_path
    end
  end

  private

  def require_logged_in
      redirect_to root_path unless current_user
  end

end
