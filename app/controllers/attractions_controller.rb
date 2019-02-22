class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save && User.find(session[:user_id]).admin
        redirect_to attraction_path(@attraction), notice: "Attraction Created"
      else
        redirect_to 'users/new'
      end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)

  end

  def destroy
  end

  def new
    @attraction = Attraction.new
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end
end
