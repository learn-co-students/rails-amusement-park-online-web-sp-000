class UsersController < ApplicationController
  #before_action :authentication_required

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
    
  end

  def show
    if session[:user_id].blank?
      redirect_to '/'
    else
      @user = User.find(params[:id])
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end