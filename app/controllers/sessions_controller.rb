class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:user][:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      redirect_to signin_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end