class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to(user_path(@user.id))
  end

  def show
    #binding.pry
    if logged_in?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  private

    def authorization
      redirect_to root_path unless logged_in?
    end

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
