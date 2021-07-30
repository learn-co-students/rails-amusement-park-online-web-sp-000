class RidesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        #byebug
        @ride = Ride.create(ride_params)
        # byebug
        # @result = @ride.take_ride
        # byebug
        @take_ride = @ride.take_ride        
        # redirect_to user_path(@ride.user), flash[:message] = "#{@take_ride}" 
        redirect_to user_path(@ride.user), flash:{message: @take_ride} 
        # @user = User.find(session[:user_id])
        # check for tickets check if user is tal enough @take_it = take_ride
        #  flash: #{message:Thanks for ridingthe } - save to a variable the return value of take ride
        # these steps should be done before the redirect and attach the flash message with the redirect
        # in user show display flash message
    end 
end

private
def ride_params
    params.require(:ride).permit(:user_id, :attraction_id) 
    # if params[:ride]
end 


