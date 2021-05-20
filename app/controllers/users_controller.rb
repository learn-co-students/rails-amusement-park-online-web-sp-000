class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login @user
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])

        if current_user != @user
            redirect_to root_path
        end 
    end

    def edit
    end

    def update
        if params[:attraction_id]
        @user = User.find_by(id: params[:id])
        attraction = Attraction.find_by(id: params[:attraction_id])
        ride = Ride.create(user_id: @user.id, attraction_id: attraction.id)
        flash[:message] = ride.take_ride

        redirect_to @user
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end

    def login(user)
       session[:user_id] = user.id
    end
end
