class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(strong_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def strong_params
    params.require(:user).permit(:name, :password, :tickets, :happiness, :nausea, :height, :admin)
  end
end
