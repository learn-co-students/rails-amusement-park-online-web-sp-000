class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_authenticated
  helper_method :current_user

  private

  def verify_authenticated
    redirect_to '/' unless user_authenticated
  end

  def user_authenticated
    !!current_user
  end 

  def current_user
    User.find_by(id: session[:user_id])
  end 
end
