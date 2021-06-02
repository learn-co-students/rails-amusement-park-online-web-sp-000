class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    render 'admin/attractions_index' unless !current_user.admin
  end

  def new
    if !current_user.admin
      redirect_to user_path(current_user)
    else
      @attraction = Attraction.new
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
    @ride = Ride.new
    render 'admin/attractions_show' unless !current_user.admin
  end

  def create
    @attraction = Attraction.create(attraction_params)

    redirect_to @attraction
  end

  def edit
    if !current_user.admin
      redirect_to user_path(current_user)
    else
      @attraction = Attraction.find(params[:id])
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)

    redirect_to @attraction
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
  end

end
