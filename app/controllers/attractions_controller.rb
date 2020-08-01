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
      attraction = Attraction.find_by(params[:name])
      current_user.tickets -= attraction.tickets 
      current_user.save
      redirect_to user_path(current_user)
   end 
end
