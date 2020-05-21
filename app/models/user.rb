class User < ApplicationRecord
    has_secure_password

    def status
        if self.admin
            'ADMIN'
        end
    end

    def mood
        if self.happiness >2
            'happy'
        else
            'sad'
        end
    end

end
