require "pry"

class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create #creating a new user, and then logging them in.
    @user = User.new(user_params)
    binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
  end
end
