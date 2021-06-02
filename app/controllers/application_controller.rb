class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    true if session[:user_id]
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end

end
