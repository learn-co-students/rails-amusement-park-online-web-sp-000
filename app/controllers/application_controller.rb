class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper SessionsHelper

  def index
    render :'index'
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def logged_in?
    session[:user_id] ? true : false
  end

  def current_user
    User.find(session[:user_id])
  end

end
