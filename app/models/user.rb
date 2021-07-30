class User < ActiveRecord::Base
  has_secure_password
  has_many :rides 
  has_many :attractions, through: :rides 
  
  def mood 
# <<<<<<< HEAD
    # byebug
    # unless admin
# =======
    # byebug
    unless admin
# >>>>>>> fecfc837726acdad5dd85d5cb71cd79675f48d6c
    nausea > happiness ? 'sad' : 'happy'
  end
end 
end