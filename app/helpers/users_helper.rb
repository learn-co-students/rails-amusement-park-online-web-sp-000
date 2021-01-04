module UsersHelper

  def show_or_go_on
    if @user.admin
      "Show"
    else
      "Go on"
    end
  end
 
end
