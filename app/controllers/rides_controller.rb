class RidesController < ApplicationController
    def create
        ride = Ride.create(ride_params)
        if ride.user.height > ride.attraction.min_height && ride.user.tickets > ride.attraction.tickets
            updated_ticket_count = ride.user.tickets - ride.attraction.tickets
            new_happiness = ride.user.happiness + ride.attraction.happiness_rating
            new_nausea = ride.user.nausea + ride.attraction.nausea_rating
            ride.user.update(tickets: updated_ticket_count, happiness: new_happiness, nausea: new_nausea)
            message = "Thanks for riding the #{ride.attraction.name}!"
        elsif ride.user.height < ride.attraction.min_height && ride.user.tickets < ride.attraction.tickets
            message = "You do not have enough tickets to ride the #{ride.attraction.name}." + "You are not tall enough to ride the #{ride.attraction.name}." 
        elsif ride.user.height < ride.attraction.min_height
            message = "You are not tall enough to ride the #{ride.attraction.name}"
        elsif ride.user.tickets < ride.attraction.tickets
            message = "You do not have enough tickets to ride the #{ride.attraction.name}"
        end
        redirect_to user_path(ride.user), flash: { message: message }
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end