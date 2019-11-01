class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(session_params)
    if @user && @user = @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to signin_path
    end
  end

  def show
  end
  
  def destroy
    reset_session
    redirect_to signin_path
  end

  private

  def session_params
    params.require(:user).permit[:name, :password]
  end

end
