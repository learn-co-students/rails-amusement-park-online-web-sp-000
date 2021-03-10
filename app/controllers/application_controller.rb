class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def current_user
  #   User.find(session[:user_id])
  # end

  # def is_admin?
  #   current_user.admin
  # end
end
