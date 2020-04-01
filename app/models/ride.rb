class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find_by_id(id)
    @attraction = Attraction.find_by_id(id)
    
    if @attraction.tickets > @user.tickets && @attraction.min_height > @user.height
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @attraction.tickets > @user.tickets
      "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @attraction.min_height > @user.height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else

    end
  end
  
end
