class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  private

  def require_login
    return redirect_to root_path unless ((session.include? :user_id) && (current_user.id == session[:user_id]))
  end


end
