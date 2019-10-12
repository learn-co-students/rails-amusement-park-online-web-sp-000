class SessionsController < ApplicationController
  def welcome
  end

  def signin
  end

  def create
    @user = User.find_by(name: session_params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
  
  def destroy
    session.destroy
    redirect_to root_path
  end

  private 

  def session_params
    params.require(:user).permit(:name)
  end
end