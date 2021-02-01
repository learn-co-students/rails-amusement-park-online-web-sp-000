class RidesController < ApplicationController
  def create
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @user = User.find(params[:ride][:user_id])
    @ride = Ride.create(attraction: @attraction, user: @user)
    flash[:notice] = @ride.take_ride
    puts @ride_result
    redirect_to "/users/#{@user.id}"
  end

  private

  def rides_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
