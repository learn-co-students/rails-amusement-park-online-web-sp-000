class AttractionsController < ApplicationController
def new
end

  def index
    @user= User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
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

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end