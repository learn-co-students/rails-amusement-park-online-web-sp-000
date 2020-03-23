class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user_name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    else
      redirect_to '/signin'
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:user_name=, :admin, :password, :name)
  end

end
