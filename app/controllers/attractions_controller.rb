class AttractionsController < ApplicationController

  before_action :require_login, only: [:show]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def index
    @attractions = Attraction.all
    @user = current_user
  end
  
  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      flash.notice = ["Could not create attraction.", @attraction.errors.full_messages].join("\r\n")
      redirect_to new_attraction_path
    end
  end
  
  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end
  
  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
