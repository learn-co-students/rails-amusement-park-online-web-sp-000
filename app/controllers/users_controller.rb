class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    require_login
    @user = User.find(params[:id])
  end


  private 

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
  
end