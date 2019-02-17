class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id 
    session[:admin] = @user.admin
    redirect_to user_path(@user)
  end

  def show
    if logged_in?
      @user = User.find(session[:user_id])
    else
      redirect_to controller: "welcome", action: "home"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end
