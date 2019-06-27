class UsersController < ApplicationController

  def new
  end

  def create
    #binding.pry
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    not_logged_in
    @user = User.find(params[:id])
  end

  def update

  end

private
  def user_params
    params.require(:user).permit(:name, :height, :nausea, :tickets, :happiness, :admin, :password)
  end
end
