class SessionController < ApplicationController

  def signin
    @user = User.new
    @users = User.all
  end

  def load
    # raise params.inspect
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signin_url
    end
  end

  def logout
    session.clear
    redirect_to root_url
  end
end
