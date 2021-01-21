class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:name]
  end

  #def require_logged_in
  #  redirect_to '/login' unless current_user
  #end
end
