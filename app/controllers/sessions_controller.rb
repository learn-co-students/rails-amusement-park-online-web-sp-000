class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(:name => params[:name])
    if @user && @user = @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to login_path
    end
  end

  def show
  end
  
  def destroy
    reset_session
    redirect_to login_path
  end

end
