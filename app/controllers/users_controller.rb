class UsersController < ApplicationController
  def new
    @user = User.new
  end

  
  def show
    redirect_to '/' unless session.include? :user_id
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
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
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
