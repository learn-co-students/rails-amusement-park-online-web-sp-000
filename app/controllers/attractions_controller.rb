class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
  end
=begin
  def do_ride
    ride = Ride.create()
    #(id: params[:attraction_id])
    #(params[:user_id])
    attraction = Attraction.find_by(id: params[:attraction_id])
    ride = attraction.rides.find {|item| item.user_id.include?(params[:user_id])}
    #user = User.find_by(id: params[:user_id])
    #puts "User id is #{user.id}, #{user}"
    #rides = user.rides.find {|item| item.attraction_id.include?(params[:attraction_id])}
    #puts attraction
    #puts "Rides are " + attraction.rides
    #ride = rides.find {|item| item.user_id.include?(params[:user_id])}
    #find_by(attraction_id: params[:id])
    #puts "Attraction id is #{params[:id]}, #{attraction}"
    #puts "Ride id is #{ride.id}, #{ride}"
    ride.take_ride
    redirect_to user_path(user)
  end
=end
end
