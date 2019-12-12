class RidesController < ApplicationController

    def create
      @ride = Ride.new(ride_params)
      @ride.take_ride
      if !@ride.tall_enough? && !@ride.enough_tickets?
        flash[:notice] = @ride.not_enough_height + @ride.not_enough_ticket
      elsif !@ride.tall_enough? 
        flash[:notice] = @ride.not_enough_height
      elsif !@ride.enough_tickets?
        flash[:notice] = @ride.not_enough_ticket
      else
        flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!" 
      end
      redirect_to user_path(@ride.user)

    end

    private

  def ride_params
    params.require(:ride).permit(
    :user_id,
    :attraction_id
    )
  end

end
