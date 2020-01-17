class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    attr_accessor :restrictions

    def take_ride
        if output = run_restrictions
            self.status = "failed"
        else 
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
            self.status = "executed"
        end
        output
    end

    def check_ticket_restriction
        if user.tickets < attraction.tickets
            @restrictions ||= [] 
            @restrictions << " You do not have enough tickets to ride the #{attraction.name}."
        end
    end

    def check_height_restriction
        if user.height < attraction.min_height
            @restrictions ||= [] 
            @restrictions  << " You are not tall enough to ride the #{attraction.name}."
         end
    end

    def run_restrictions
        check_ticket_restriction
        check_height_restriction
        @restrictions ||= [] 
        if @restrictions.any?
            full_message = "Sorry."
            restrictions.each do |restriction_message|
                full_message += restriction_message
            end
        end
        full_message
    end

end
