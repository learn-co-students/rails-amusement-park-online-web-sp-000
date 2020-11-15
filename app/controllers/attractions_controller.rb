class AttractionsController < ApplicationController
    before_action :logged_in?
    # May want to add before_action method to validate if params[:id] is valid and, if not, to redirect

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.new(attraction_params)
        if attraction.save
          redirect_to attraction, alert: "Created!"
        else
          render :new, alert: "Please fill in all fields."
        end        
    end

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = current_attraction
    end

    def edit
        @attraction = current_attraction
    end

    def update
        attraction = current_attraction
        if attraction.update(attraction_params)
            redirect_to attraction
        else
            redirect_to edit_attraction_path
        end
    end

    def destroy
    end

    def ride
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:format])
        # Note that above should probably be adjusted because a ride should not be created / counted in the view if user is unable to go on ride (i.e. validation fails)
        msg = ride.take_ride
        redirect_to current_user, alert: msg
    end

    private

    def current_attraction
        Attraction.find(params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end
