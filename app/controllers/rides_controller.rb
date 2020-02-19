class RidesController < ApplicationController 
    def index 
        @rides = Ride.all 
    end 

    def create
        @ride = Ride.create(ride_params)
        flash[:notice] = @ride.take_ride 
        redirect_to user_path(@ride.user, :message => flash[:notice])
    end 

    def show 

    end 

    def new 

    end 

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)        
    end 
end 