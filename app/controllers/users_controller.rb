class UsersController < ApplicationController
  def create
    
    @user = User.find_or_create_by(user_params)

  end

  def new
    @user = User.new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin, :password_confirmation)
  end
end
