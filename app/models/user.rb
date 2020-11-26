class User < ActiveRecord::Base
    has_secure_password

    # # validates :name, :height, :happiness, :nausea, :password, presence: true
    # validates :happiness, :nausea, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    # validates :tickets, :height, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }

    has_many :rides
    has_many :attractions, through: :rides

        def user_name
            self.name
        end

        def user_name=(name)
            self.name = name
        end

    def mood
        if self.happiness.to_i > self.nausea.to_i
            'happy'
        elsif self.happiness.to_i < self.nausea.to_i
            'sad'
        end
    end


    def admin?
        self.admin ? true : false
    end
end
