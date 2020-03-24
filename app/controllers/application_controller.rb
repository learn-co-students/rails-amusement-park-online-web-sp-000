class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_login
    if !session.include? :user_id || session[:user_id].blank? || session[:user_id] == nil
      redirect_to root_path
    end
  end
end
