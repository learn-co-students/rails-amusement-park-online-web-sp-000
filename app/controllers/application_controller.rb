class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if session[:user_id]
        @user = User.find_by :id=>session[:user_id]
    end
end
end
