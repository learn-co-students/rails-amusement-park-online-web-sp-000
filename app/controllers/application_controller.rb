class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_verified
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_authenticated?
    !!current_user
  end

  def user_verified
    redirect_to root_path unless user_authenticated?
  end
end
