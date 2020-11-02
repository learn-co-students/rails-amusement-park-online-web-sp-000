require 'pry'
class UsersController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      flash[:error] = "Please Sign Up"
      redirect_to root_path
    end
  end

  
  def update
    ride = Ride.create(user_id: current_user.id, attraction_id: session[:last_attraction])
    flash[:message] = ride.take_ride
    redirect_to user_path(current_user)
  end

  def signin
    @user = User.new
    @users = User.all
  end

  def logout
    session.destroy
    redirect_to root_path
  end
  
  def sign_user_in
    @user = User.find_by(name: user_params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :nausea,
      :tickets,
      :admin,
      :password,
      :happiness
    )
  end
end