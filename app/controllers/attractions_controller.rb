class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end
  
  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])

  end 

def update
  @attraction = Attraction.find_by(id: params[:id])
  @attraction = Attraction.update(attraction_params)
  # byebug
  redirect_to :controller => 'attractions', :action => 'show'
end 

  def destroy
  end 

  def show
      # @rides = Ride.all
      @attraction = Attraction.find_by(id: params[:id])
      # byebug
      @ride = @attraction.rides.build(user_id: current_user.id)
    if session[:user_id] 
      @user = User.find(session[:user_id]) #bringing a user inside the attractions index page
      # redirect_to user_path - this is the user admin part to check if user is logged in or not
    end
  end

  def create
    
    @attraction = Attraction.create(attraction_params)
    # byebug
    redirect_to attraction_path(@attraction)
    # use create instead of new to create and save an id
    # check to see if admin. if admin let them add an attraction. 
  end 

  private 
  def attraction_params
  params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end