require 'pry'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verified_user 
  helper_method :current_user
  # skip_before_filter :require_login, :except=>[:new,:create]
  

  private

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      redirect_to root_path
    end
  end
end