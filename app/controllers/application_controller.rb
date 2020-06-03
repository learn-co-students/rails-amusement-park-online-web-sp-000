class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :verify_user

  private 

  def verify_user 
    redirect_to '/' unless !!current_user
  end

    def current_user 
      User.find(session[:user_id])
    end

    def log_in 
      session[:user_id] = user.id 
    end

end
