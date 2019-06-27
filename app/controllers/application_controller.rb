class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    render :index
  end

private
  def logged_in?
    !!session[:user_id]
  end

  def not_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

  def is_admin?
    !!User.find(session[:user_id]).admin ? true : false
  end 
end
