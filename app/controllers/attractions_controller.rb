class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @user = User.find(session[:user_id])
    end
end
