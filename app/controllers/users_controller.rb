class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if !user
      redirect_to new_user_path
    else
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

  def show
    if current_user
      @user = User.find(current_user)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end
