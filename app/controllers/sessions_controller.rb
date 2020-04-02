class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:messages] = "Welcome #{@user.name}!"
      redirect_to user_path(@user)
    else
      flash[:errors] = "Invalid credentials. Please try again or sign up."
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    flash[:messages] = "See ya next time!"
    redirect_to root_path
  end
  
end