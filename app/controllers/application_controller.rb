class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def require_login
    redirect_to '/' unless session.include?(:user_id)
  end
end
