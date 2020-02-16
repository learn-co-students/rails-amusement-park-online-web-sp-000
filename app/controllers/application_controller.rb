class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception    


  def current_user
    User.find(session[:user_id])    
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  private

  def require_logged_in
      redirect_to controller: 'sessions', action: 'new' unless current_user
  end

end


