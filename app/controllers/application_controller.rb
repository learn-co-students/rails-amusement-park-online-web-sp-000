class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def is_user?
    !!session[:user_id]
  end

  def is_admin?
    if is_user?
      user = current_user
      user.admin
    end
  end
end
