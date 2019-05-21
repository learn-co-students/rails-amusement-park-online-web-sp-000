class SessionsController < ApplicationController
  def new
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    redirect_to new_session_path unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
