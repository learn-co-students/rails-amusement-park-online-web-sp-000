class UsersController < ApplicationController
  def new
    @user = User.new
    if @user.admin
      redirect_to root_url
    end 
  end

  def create 
  end 

  private 
  # def user_params 
  #   params.require(:user).permit(:name)
  # end 
end
