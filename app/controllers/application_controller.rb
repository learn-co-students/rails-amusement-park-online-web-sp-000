class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    redirect_to root_url unless session.include? :user_id
  end

  def current_user
    if session.include? :user_id
      User.find(session[:user_id])
    end
  end
end
