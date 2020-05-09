class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        if logged_in?
            @user = User.find_by(id: params[:id])
        else
            redirect_to root_path
        end
    end

    def update
        ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
        msg = ride.take_ride
        redirect_to user_path(current_user), notice: msg
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end
end
