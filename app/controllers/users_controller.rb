class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
    redirect_to root_path unless session.include?(:user_id)
    @user = User.find(params[:id])
    if session[:ride_message]
      @message = session[:ride_message]
    end
  end

  def signin
    @users = User.all
  end

  def verify_signin
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @users = User.all
      render '/users/signin'
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def welcome
    #temp action to move tests along, not sure what is needed for home page
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end
end
