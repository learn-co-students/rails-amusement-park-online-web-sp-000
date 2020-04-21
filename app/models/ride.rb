class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @user = User.find_by(id: self.user_id)
        @attraction = Attraction.find_by(id: self.attraction_id)
        if @user.height >= @attraction.min_height && @user.tickets >= @attraction.tickets
            @user.tickets = (@user.tickets - @attraction.tickets)
            @user.happiness = (@user.happiness + @attraction.happiness_rating)
            @user.nausea = (@user.nausea + @attraction.nausea_rating)
            @user.save
            @msg = "Thanks for riding the #{@attraction.name}!"
        elsif @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
            @msg = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.height < @attraction.min_height
            @msg = "Sorry. You are not tall enough to ride the #{@attraction.name}."
        else 
            @msg = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        end
        return @msg
    end

    def total_rides
        x = 0
        @rides = Ride.each do |ride|
            if ride.attraction_id == self.attraction_id
                x += 1
            end
        end
        x
    end

end
