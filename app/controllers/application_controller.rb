class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  #helper_method :logged_in?, :current_user, :user_params

  # def is_user?
  #   !!session[:user_id]
  # end

  # def clear_alert
  #   binding.pry
  # end

  def logged_in?
    redirect_to root_path unless current_user
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
