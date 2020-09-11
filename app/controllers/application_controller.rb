class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  require 'rack-flash'
  
  def current_user
    User.find_by(id: session[:user_id])
  end
  def require_logged_in
    redirect_to controller: 'attractions', action: 'welcome' unless current_user
  end

end
