class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :notice, :warning
  helper_method :current_user

  def authentication_required
    if !logged_in?
      redirect_to '/'
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id!(session[:user_id])
  end
  
end
