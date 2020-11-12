class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end
end
