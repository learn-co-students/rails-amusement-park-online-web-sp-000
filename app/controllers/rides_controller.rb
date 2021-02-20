class RidesController < ApplicationController


    def create
        #   byebug
        
        ride=Ride.create(ride_params)
        # byebug
        ride.take_ride
        if @error
            flash[:message] = "#{@error}"
        end
        message = ride.display_message
        redirect_to user_path(current_user), flash: { testy: message }
    end



     
    private
     
    def ride_params
         params.require(:ride).permit(:attraction_id, :user_id)
    end
end
