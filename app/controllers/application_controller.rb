class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user
  helper_method :logged_in?

  private

  def logged_in?
    redirect_to root_path unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #if @current_user is undefined, assign the value of User.find(session[:user_id]) under condition that session[:user_id] is true. Otherwise, leave it alone
  end
end
