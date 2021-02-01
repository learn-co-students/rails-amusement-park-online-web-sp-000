module ApplicationHelper
  def root_url
    ""
  end
  def logged_in?
    !session[:user_id].blank?
  end
  def current_user
    User.find(session[:user_id])
  end
  def is_admin?
    User.find(session[:user_id]).admin == true
  end
end
