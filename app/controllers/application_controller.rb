class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authenticated_user?
  # before_action :verified_user

  # def verified_user
  #   redirect_to root_path unless authenticated_user?
  # end
  
  def authenticated_user?
    !!current_user
  end

  def current_user
     User.find_by(id: session[:user_id])   
  end

end
