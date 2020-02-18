class AttractionsController < ApplicationController
def new
end

  def index
    @user= User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @user= User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction=Attraction.new
  end

  def create
    @attraction=Attraction.create(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end