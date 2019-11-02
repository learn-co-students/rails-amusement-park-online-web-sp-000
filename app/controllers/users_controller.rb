class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id

    redirect_to user_path(current_user)
  end

  def show
    require_logged_in
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end
