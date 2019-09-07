class RidesController < ApplicationController
  include ApplicationHelper

  def create
    # binding.pry
    verify_user
    attraction = Attraction.find(ride_params[:attraction_id])
    @ride = Ride.create(ride_params)

    if current_user.height < attraction.min_height && current_user.tickets < attraction.tickets
      flash[:alert] = ["You are not tall enough to ride the #{attraction.name}!", "You do not have enough tickets to ride the #{attraction.name}!"]
    elsif current_user.height < attraction.min_height
      flash[:alert] = "You are not tall enough to ride the #{attraction.name}!"
    elsif current_user.tickets < attraction.tickets
      flash[:alert] = "You do not have enough tickets to ride the #{attraction.name}!"
    else
      @ride.take_ride
      flash[:success] = "Thanks for riding the #{attraction.name}!"
    end
      redirect_to user_path(current_user)
  end

  private
  
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

  def verify_user
    redirect_to root_path unless current_user == User.find(ride_params[:user_id])
  end
end