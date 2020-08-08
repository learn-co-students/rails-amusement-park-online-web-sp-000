class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home 
    redirect_to "welcome"
  end
end
