class AttractionsController < ApplicationController
    def new
      @attraction = Attraction.new
    end
  
    def index
      @attractions = Attraction.all 
    end
  
    def create
        #binding.pry
        @attraction = Attraction.create(attraction_params)
        if @attraction.valid?
          redirect_to @attraction
        else
          render :new
        end
    end

    def show
        @attraction = Attraction.find(params[:id])
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
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :tickets, :nausea_rating)
      end
  end