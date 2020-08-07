class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

    # method for checking current_user
    def current_user
      if session[:user_id].present?
        user = User.find_by(:id => session[:user_id])
      end
    end

    # if user isn't logged in, redirect to root url
    def logged_in?
      unless current_user
        redirect_to root_url
      end
    end

  private

    def current_user
      User.find(session[:user_id])
    end
end
