class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:create, :new]

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end
end
