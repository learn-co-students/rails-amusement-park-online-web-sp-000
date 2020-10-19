class RidesController < ApplicationController
    def new

    end

    def create
        ride = Ride.new(ride_params)
        if ride.save
            flash[:error] =ride.take_ride

            redirect_to user_path(current_user)
        else
            redirect_to attractions_path
        end

    end

    private 
      def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
      end
end