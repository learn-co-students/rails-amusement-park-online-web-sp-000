class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  skip_before_action :require_login, only: [:home]
  def current_user
    User.find(session[:user_id])
  end
  def require_login
    if !session.include? :user_id
      redirect_to root_path
    end
  end
end
