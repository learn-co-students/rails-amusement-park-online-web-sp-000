class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session_hash
    else
      render 'users/new'
      session_hash
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height)
  end
end
