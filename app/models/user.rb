class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides
    #before_save :default_values

    #def default_values
     # !user.admin
   # end

    def mood
        unless admin
          happiness > nausea ? "happy" : "sad"
        end
      end
end
