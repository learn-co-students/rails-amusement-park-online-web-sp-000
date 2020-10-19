class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password
    validates :name, presence: true

    def is_admin?
      self.admin
    end

    def mood
        if nausea && happiness
            if nausea > happiness
               "sad"
            else
               "happy"
            end
        end
    end
end
