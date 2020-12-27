class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(name: params["user_name"])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @users = User.all
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
