class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end
  
  def ride
    # ride the ride!
    redirect_to user_path(current_user)
  end

end
