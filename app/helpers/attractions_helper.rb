module AttractionsHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def nav_menu
    if logged_in?
      render 'loggedin'
    else
      render 'loggedout'
    end
  end

end
