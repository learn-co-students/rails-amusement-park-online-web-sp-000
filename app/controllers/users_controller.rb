class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    redirect_to '/users/new' unless @user.save
    login(@user)
  end

  def show
    redirect_to root_path unless is_current_user_page?
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
