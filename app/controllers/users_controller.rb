class UsersController < ApplicationController

  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user
  end

  def show
    if !logged_in?
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end


end
