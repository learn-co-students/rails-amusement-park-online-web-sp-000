class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end

  def show
    if !session[:user_id].blank?
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :nausea, :happiness, :tickets, :admin)
  end


end
