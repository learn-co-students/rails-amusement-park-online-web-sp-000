class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
    if @user.admin
      redirect_to root_url
    end 
  end

  def create 
    @user = User.create(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else  
      redirect_to '/users/new'
    end 
  end 

  def show 
    # byebug
    @user = User.find_by_id(params[:id])
    # byebug
  end 

  private 
  def user_params 
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end 
end
