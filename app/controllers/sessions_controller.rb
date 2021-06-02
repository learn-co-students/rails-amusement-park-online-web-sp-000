class SessionsController < ApplicationController
  def signin
    if !logged_in?
      @users = User.all
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
