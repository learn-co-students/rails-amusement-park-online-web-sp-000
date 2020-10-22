class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides


    def mood
        if self.happiness 
            self.nausea > self.happiness ? "sad":"happy"
        end
    end


end

#build the models*****

#make validations???

#build controllers****



#set routes
    #homepage
    #signup
    #user_show
    #login
    #logout
    #attractions_path
    #attraction_show_path
    #new_ride_path



#make homepage

#make forms

#make methods for using tickets






