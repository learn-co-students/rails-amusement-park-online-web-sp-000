require 'pry'

class AttractionsController < ApplicationController
 
    def index
        @attractions = Attraction.all
        @user = User.find(session[:user_id]) 
      end

    def show
      @attraction = Attraction.find(params[:id])
      @user = User.find(session[:user_id]) 
    end

    def ride
      @user = User.find(session[:user_id])
      @attraction = Attraction.find(params[:id])
      @ride = Ride.create(:user_id => @user.id, :attraction_id => @attraction.id)
      @alert = @ride.take_ride
      redirect_to user_path(@user), alert: @alert    
    end    

    def new
      @attraction = Attraction.new
    end

    def create
      @attraction = Attraction.new(attraction_params)
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
    
        if @attraction.update(attraction_params)
          redirect_to attraction_path(@attraction)
        else
          render :edit
        end      
    end 
   
    def destroy
        Attraction.find(params[:id]).destroy
        redirect_to action: "index"
    end  

    private
   
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end    
end