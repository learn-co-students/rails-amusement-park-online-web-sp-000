class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verified_user
  helper_method :current_user

  def home
  end

  private

  def verified_user
    redirect_to root_path unless user_authenticated
  end

  def user_authenticated
    !!current_user
  end

  def current_user
    # @user ||= 
    User.find_by(id: session[:user_id]) #if session[:id]
  end
end
