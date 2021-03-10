module ApplicationHelper

  def current_user
    User.find(session[:user_id])
  end

  def is_admin?
    current_user.admin
  end

end
