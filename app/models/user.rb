class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true

    def is_admin?
      self.admin
    end
end
