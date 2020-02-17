class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def home
    render 'home'
  end

  def create
    @user = User.create(user_params)
    session[:user_id]=@user.id
    redirect_to user_path(@user.id)
  end

  def show
    if logged_in?
    @user= User.find(params[:id])
    else redirect_to '/'
    end
  end

  def logged_in?
    session[:user_id].present?
  end


  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end

  
end

