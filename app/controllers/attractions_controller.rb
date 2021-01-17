class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def cost
    attraction = Attraction.find_by(id: params[:id])
    ride = Ride.create 
    ride.attraction = attraction
    ride.user = current_user
    flash[:notice] = ride.take_ride
    # tickets = current_user.tickets - attraction.tickets
    # happiness = current_user.happiness + attraction.happiness_rating
    # nausea = current_user.nausea + attraction.nausea_rating
    # current_user.update(tickets: tickets, happiness: happiness, nausea: nausea)
    # flash[:notice] = "Thanks for riding the #{attraction.name}!"
    redirect_to user_path(current_user)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    Attraction.update(attraction_params)
    redirect_to attraction_path(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
