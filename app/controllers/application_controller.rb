class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_logged_in, except: [:index] 
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    return redirect_to root_path unless logged_in?
  end

  def index
    
  end
end
