class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private 

    def current_user 
      User.find(session[:user_id])
    end

    def log_in 
      session[:user_id] = user.id 
    end

end
