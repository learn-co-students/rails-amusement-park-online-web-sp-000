class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in_or_redirect
    if !logged_in? || session[:user_id] != params[:id]
      redirect_to root_path
    end
  end

  def logged_in_admin
    if !logged_in? || !current_user.admin?
      redirect_to attractions_path
    end
  end
end
