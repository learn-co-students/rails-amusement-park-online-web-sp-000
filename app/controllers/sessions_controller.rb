class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    # raise params[:user].inspect
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to(user_path(@user))
    else
      flash[:alert] = "User cannot be authenticated"
      redirect_to(signin_path)
    end
  end

  def destroy
    reset_session
    redirect_to(root_path)
  end

end
