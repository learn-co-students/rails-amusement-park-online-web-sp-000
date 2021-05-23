class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def session_hash
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end
end
