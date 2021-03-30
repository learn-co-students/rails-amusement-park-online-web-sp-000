class User < ActiveRecord::Base
    before_save :default_values
    has_secure_password 
    has_many :rides
    has_many :attractions, through: :rides
   
    def mood
        unless admin
            self.happiness > self.nausea ? "happy" : "sad"
        end
    end
    
    def default_values 
        self.admin = false if self.admin.nil?
    end


end
