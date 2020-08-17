class UsersController < ApplicationController

  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      flash[:error] = "Please sign up or log in."
      redirect_to root_path
    end
  end

  

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end

  def logged_in?
    !!session[:user_id]
  end
end