class AttractionsController < ApplicationController
   def index 
      @attractions = Attraction.all 
   end 

   def show 
      # byebug
      @attraction = Attraction.find_by(params[:name])
   end 

   def user_goes_on_ride
      # byebug
      attraction = Attraction.find(params[:id])
      ride = Ride.create(user_id: current_user.id, attraction_id: attraction.id)
      ride.take_ride
      # byebug
      if !ride.user_height_not_tall_enough? && ride.user_tickets_are_enough
         flash[:notice] = "Thanks for riding the #{attraction.name}!"
      elsif ride.user_tickets_and_height_not_enough? 
         flash[:notice] = "You do not have enough tickets to ride the #{attraction.name}\n" + "You are not tall enough to ride the #{attraction.name}"
      elsif ride.user_height_not_tall_enough?
         flash[:notice] = "You are not tall enough to ride the #{attraction.name}"
      elsif !ride.user_tickets_are_enough
         flash[:notice] = "You do not have enough tickets to ride the #{attraction.name}"
      end 
      # current_user.tickets -= attraction.tickets 
      # current_user.save
      redirect_to user_path(current_user)
   end 
end
