class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorized_user
  skip_before_action :authorized_user, only: [:index]
  helper_method :current_user

  def index
  end

  private

  def authorized_user
    redirect_to '/' unless signed_in
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def signed_in
    !!current_user
  end
end
