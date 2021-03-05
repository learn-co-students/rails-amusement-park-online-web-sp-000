class AttractionsController < ApplicationController
def index
    # binding.pry
    @attractions = Attraction.all
end

def show
    @attraction = Attraction.find(params[:id])
    @ride = @attraction.rides.build(user_id: session[:user_id])
end

def new
    @attraction = Attraction.new()
end

def create
    @attraction = Attraction.create(a_params)
    # binding.pry
    redirect_to "/attractions/#{@attraction.id}"
end

def edit
    @attraction = Attraction.find(params[:id])
end

def update
    # binding.pry
    a = Attraction.find(params[:id])
    # binding.pry
    a.update(a_params)
    a.save
    redirect_to "/attractions/#{a.id}"
end

  private
  def a_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
