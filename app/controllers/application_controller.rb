class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
  end

  helper_method :is_admin?
  def is_admin?
    User.find(session[:user_id]).admin
    # binding.pry
  end

end
