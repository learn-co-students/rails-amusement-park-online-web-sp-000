class UsersController < ApplicationController
  def show
    redirect_to root_url if session[:user_id].blank? 
    @ride_message = Ride.last.take_ride if Ride.last
    @user = User.find(params[:id])
  end

  def signin
    
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
