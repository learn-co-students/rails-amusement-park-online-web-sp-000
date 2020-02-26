class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user_id

  def current_user_id
    session[:user_id].to_s
  end
end
