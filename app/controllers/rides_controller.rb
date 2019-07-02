class RidesController < ApplicationController
  def create



    #build the ride
    attraction = Attraction.find(params[:attraction_id])
    user = current_user
    ride = attraction.rides.build()
    ride.user = current_user
    ride.save

    flash[:alert] = ride.take_ride

    # #update the attraction
    # attraction.ticket_number ? (attraction.ticket_number +=1) : (attraction.ticket_number = 1)
    # attraction.save
    #
    # #update the user
    # user.tickets -= attraction.tickets
    # user.nausea += attraction.nausea_rating
    # user.happiness += attraction.happiness_rating
    # user.save

    redirect_to user_path(current_user)
  end
end
