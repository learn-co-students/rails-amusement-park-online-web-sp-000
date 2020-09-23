class RidesController < ApplicationController
    protect_from_forgery 


def create
    @rider=Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:message]= @rider.take_ride
    redirect_to user_path(@rider.user)
end

 

 

end
