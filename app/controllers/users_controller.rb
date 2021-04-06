class UsersController < ApplicationController
  def new
    @user = User.new
  end

  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    @user.save
    redirect_to user_path(@user)
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password_digest, :height, :happiness, :nausea, :tickets, :admin)
  end
end
