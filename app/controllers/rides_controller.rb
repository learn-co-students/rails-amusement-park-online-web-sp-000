class RidesController < ApplicationController
  # helper_method :thanks

  def new
    @ride = Ride.new
  end

  def create
    @attraction = Attraction.find(ride_params[:attraction])
    @ride = Ride.new(:attraction_id => ride_params[:attraction], :user_id => current_user.id)
    flash.notice = @ride.take_ride
    @ride.take_ride
    if @ride.valid?
      redirect_to user_path(current_user)
    else
      redirect_to attraction_path(@attraction)
    end
  end
    



    # if @ride.take_ride
    #   flash.notice = "Thanks for riding the #{@attraction.name}!"
    #   redirect_to user_path(current_user)
    # else
    #   redirect_to attraction_path(@attraction)
    # end



  private

  def ride_params
    params.permit(:attraction)
  end

end