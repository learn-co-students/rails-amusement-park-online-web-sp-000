class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user
  
    private
  
    def verified_user
      redirect_to '/' unless user_is_authenticated
    end
  
    def user_is_authenticated
      !!current_user
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end
end





  #   helper_method :authentication_required 

#   def authentication_required
#     if !logged_in?
#       redirect_to signin_path
#     end
#   end

#   def logged_in?
#     session[:user_id]
#   end

#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end

# private
  
#   def authorize
#     redirect_to signin_path, alert: "You are not an admin" if current_user.try(:admin) == false
#   end

