class AttractionsController < ApplicationController
  def index
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin?
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def update
    if current_user.admin?
      begin
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
      rescue
        puts "Attraction not found!"
        redirect_to attractions_path
      end
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def edit
    if current_user.admin?
      begin
        @attraction = Attraction.find(params[:id])
      rescue
        puts "Attraction not found!"
        redirect_to attractions_path
      end
    else
      redirect_to attractions_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
