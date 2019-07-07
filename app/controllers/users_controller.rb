class UsersController < ApplicationController
  before_action :require_login, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to users_new_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :password, :height, :admin)
  end
end
