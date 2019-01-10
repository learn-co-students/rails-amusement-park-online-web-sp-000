class UsersController < ApplicationController

  def new    
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.notice = "Could not create user."
      redirect_to new_user_path
    end
    
  end
  
  private 

  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :tickets, :password)
  end
  
end