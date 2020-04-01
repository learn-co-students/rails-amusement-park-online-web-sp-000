class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user, :logged_in?

  # Methoda built in controllers don't permeate in ActionViews part of the code
  # Cannot call this in html.erb unless explicitly said by using helper_method

end
