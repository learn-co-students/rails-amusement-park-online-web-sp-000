class AttractionsController < ApplicationController
  def index
    if !logged_in?
      redirect_to root_path
    else
      @attractions = Attraction.all
      @user = current_user
    end
  end

  def show
    if !logged_in?
      redirect_to root_path
    else
      @user = current_user
      @attraction = Attraction.find(params[:id])
    end
  end

  def new
    redirect_to user_path(@user) unless current_user.admin?
    @attraction = Attraction.new 
  end

  def create
    logged_in_admin
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      return redirect_to new_attraction_path
    end
  end

  def edit
    logged_in_admin
    @attraction = Attraction.find(params[:id])
  end

  def update
    logged_in_admin
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end
end
