class RidesController < ApplicationController


  def create
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @ride = Ride.new(ride_params)
    if @ride.save

      flash.alert = "#{@ride.take_ride}"
      redirect_to @attraction
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
