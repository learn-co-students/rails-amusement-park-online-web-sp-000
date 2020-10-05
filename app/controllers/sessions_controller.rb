class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user_name])        

    if user.try(:authenticate, params[:user_password])
        log_user_in(user)            
    else        
        redirect_to new_user_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
