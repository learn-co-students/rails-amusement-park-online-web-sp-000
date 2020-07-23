class User < ActiveRecord::Base
  has_many :rides 
  has_many :attractions, through: :rides 

  has_secure_password

  def mood 
    # if happiness greater than or equal to nausea = true return 'happy' else return 'sad'
    self.happiness >= self.nausea ? 'happy' : 'sad'
  end

end
