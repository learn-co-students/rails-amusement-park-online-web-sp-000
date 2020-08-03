class AttractionsController < ApplicationController
   def index 
      @attractions = Attraction.all 
   end 

   def new 
   end 

   def create 
      @attraction = Attraction.create(attraction_params)
      if @attraction.save 
         redirect_to attraction_path(@attraction)
      else  
         redirect_to new_attraction_path
      end 
   end 

   def edit 
      @attraction = set_attraction
   end 

   def update 
      @attraction = set_attraction
      if !attraction_params.empty?
         @attraction.update(attraction_params)
         redirect_to attraction_path(@attraction.id)
      else  
         redirect_to edit_attraction_path(@attraction)
      end 
   end 

   def show 
      @attraction = set_attraction
   end 

   def user_goes_on_ride
      attraction = Attraction.find(params[:id])
      ride = Ride.create(user_id: current_user.id, attraction_id: attraction.id)
      ride.take_ride
      determine_go_on_ride_display_message(ride, attraction)
      redirect_to user_path(current_user)
   end 

   private 
   def attraction_params 
      params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
   end 

   def set_attraction 
      Attraction.find_by_id(params[:id])
   end 

   def determine_go_on_ride_display_message(ride, attraction)
      if !ride.user_height_not_tall_enough? && ride.user_tickets_are_enough
         flash[:notice] = "Thanks for riding the #{attraction.name}!"
      elsif ride.user_tickets_and_height_not_enough? 
         flash[:notice] = "You do not have enough tickets to ride the #{attraction.name}\n" + "You are not tall enough to ride the #{attraction.name}"
      elsif ride.user_height_not_tall_enough?
         flash[:notice] = "You are not tall enough to ride the #{attraction.name}"
      elsif !ride.user_tickets_are_enough
         flash[:notice] = "You do not have enough tickets to ride the #{attraction.name}"
      end 
   end 
end
