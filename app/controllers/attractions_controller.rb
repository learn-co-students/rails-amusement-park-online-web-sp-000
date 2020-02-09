class AttractionsController < ApplicationController
  before_action :authorize, except: [:edit, :update]
  before_action :authorize_admin, only: [:edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(all_attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(all_attraction_params)
      flash[:notice] = 'attraction successfully updated.'
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = "There was a problem updating this attraction."
      render 'edit'
    end
  end

  private

  def all_attraction_params
    attraction_params(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def attraction_params(*args)
    params.require(:attraction).permit(*args)
  end

end