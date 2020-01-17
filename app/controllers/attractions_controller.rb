class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        if User.find(session[:user_id]).admin
            @admin = true
        end
    end

    def show
        @attraction = Attraction.find(params[:id])
        if User.find(session[:user_id]).admin
            @admin = true
        end
    end

    def new
        @attraction = Attraction.new
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end
    
    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction
    end

    def update
        attraction = Attraction.find(params[:id])
        attraction.update(attraction_params)
        redirect_to attraction
    end

    def takeride
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
        if !@user
            redirect_to 'index'
        else
            ride = Ride.create(:user_id => @user.id, :attraction_id => @attraction.id)
            ride.take_ride
            if ride.status == "failed"
                flash[:message] = ride.run_restrictions
            else
                flash[:message] = "Thanks for riding the #{@attraction.name}!"
            end
            redirect_to ride.user
        end
    end

    private 
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end