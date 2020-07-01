class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Methods you build in controllers do not permeate
  # to action view unless you define as a helper 
  helper_method :current_user

  def authentication_required 
    if !logged_in?
      redirect_to root_path 
    end 
  end 

  def logged_in?
    # !!session[:user_id]
    !!current_user 
  end 

  def current_user 
    # the first time, you fire sql
    # subsequent times it just looks to see if @current_user is already set 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def admin_required
    if !current_user.admin 
      redirect_to root_path 
    end 
  end 
end
