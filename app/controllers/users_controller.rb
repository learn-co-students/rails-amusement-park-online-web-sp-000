class UsersController < ApplicationController
  def new
    @user = User.new
    if @user.admin
      redirect_to root_url
    end 
  end

  def create 
    @user = User.create(user_params)
    if @user.save 
      render 'show'
    else  
      redirect_to 'signup'
    end 
  end 

  def show 
    @user = User.find(params[:id])
  end 

  private 
  def user_params 
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end 
end
