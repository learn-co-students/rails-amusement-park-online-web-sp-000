class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    User.find(session[:user_id]) || nil
  end

  helper_method :current_user
end
