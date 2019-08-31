class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :admin_only, :current_user, :require_login


  def admin_only
    unless current_user.admin
      redirect_to user_path(current_user)
    end
  end


  def require_login

    unless current_user
      redirect_to root_url
    end

  end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
