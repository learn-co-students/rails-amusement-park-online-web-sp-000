##require 'pry'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    if logged_in? && @user = current_user
      render 'show'
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
  end
end
