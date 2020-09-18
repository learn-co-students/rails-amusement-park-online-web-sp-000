class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, logged_in?#, authenticate_user
  before_action :check_current_user
  private 


  def logged_in?
    !!current_user
  end 

  def authenticate_user
    if current_user && current_user.admin 
      redirect_to user_path(current_user)
    end 
  end


end 