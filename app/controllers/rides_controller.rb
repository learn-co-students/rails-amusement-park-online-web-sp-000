class RidesController < ApplicationController
  def new
  end

  def create
    @user = User.find(session[:user_id])
    @ride = Ride.create(strong_params)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@user)
  end

  private

  def strong_params
    params.require(:rides).permit(:user_id, :attraction_id)
  end
end
