module UsersHelper
  def is_admin?(user)
    user.admin
  end

  def signed_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
