class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_logged_in, :admin_only

  def current_user
    if session[:user_id].present?
      user = User.find_by(id: session[:user_id])
    end
  end

  def require_logged_in
    redirect_to 'root' unless current_user
  end

  def admin_only
    unless current_user.admin
      flash[:res] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end
end
