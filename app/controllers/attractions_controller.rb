class AttractionsController < ApplicationController
    def index 
        @attractions = Attraction.all
    end 

    def show 
        @attraction = Attraction.find(params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)

        # if @ride.user.height < @ride.min_height
        #     flash[:too_short] = "You are not tall enough to ride the #{@attraction.name}"
        # end 
        # flash[:thanks] = "Thanks for riding the #{@user.rides.name}!"
        # flash[:not_enough_tickets] = "You do not have enough tickets to ride the #{@user.rides.name}"
        # flash[:too_short_and_not_enough_tickets] = "You are not tall enough to ride the #{@user.rides.name} and you do not have enough tickets to ride the #{@user.rides.name}"

    end 
    private 
        def attraction_params
            params.require(:attractions).permit(:name, :tickets, :nausea_rating, :happiness_rating, min_height)
        end 
end
