class AttractionsController < ApplicationController
     
    def index 
        @attractions = Attraction.all
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end 

    def new 
        @attraction = Attraction.new
    end 

    def create 
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            flash[:message] = "Invalid Attraction"
            render :new
        end 
    end 

    def show 
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])  
    end 

    def edit
        @attraction = Attraction.find(params[:id]) 
    end 

    def update 
        @attraction = Attraction.find(params[:id]) 
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            flash[:message] = "Invalid Attraction Edit"
            render :edit 
        end 
    end 

    def ride
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
        result = @ride.take_ride
        if result == true
            redirect_to user_path(@user)
            flash[:message] =  "Thanks for riding the #{@attraction.name}!"
        else
            redirect_to user_path(@user)
            flash[:message] = result 
        end
    end

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
    end

end 
