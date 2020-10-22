class SessionController < ApplicationController
  def log_in
    @users = User.all
    render :'session/login'
  end

  def create
    @user = User.find(params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def log_out
    session.delete :user_id
    redirect_to root_path
  end
end
