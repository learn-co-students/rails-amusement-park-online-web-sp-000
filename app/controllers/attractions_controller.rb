class AttractionsController < ApplicationController
   def index 
      @user = User.find(session[:user_id])
      @attractions = Attraction.all
   end
   def show 
      @attraction = Attraction.find(params[:id])
      @user = User.find(session[:user_id]) 
   end
   def new
    @attraction = Attraction.new
   end

   def create
     @attraction = Attraction.create(attraction_params)
     redirect_to attraction_path(@attraction)
   end

   def edit
      @attraction = Attraction.find(params[:id])
   end

   def update
      user = User.find(session[:user_id])
       attraction = Attraction.find(params[:id])
      if !user.admin
       
        attraction_tickets = attraction.tickets
        ride =  Ride.create( user_id: user.id, attraction_id: attraction.id )
        ride_message = ride.take_ride 
        flash[:notice] = ride_message
        redirect_to user_path(user)
      else
         attraction.update(attraction_params)
        redirect_to  attraction_path(attraction)

      end
   end
   private

   def attraction_params
     params.require(:attraction).permit(:name, :min_height, :nausea_rating, :tickets,  :happiness_rating )
   end

end
