class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render '/users/new'
    end
  end

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
  end

end
