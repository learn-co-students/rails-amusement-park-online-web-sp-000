class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render "users/show"
        end
    end
    def user_params
        params.require(:user).permit(:name, :nausea, :height, :happiness, :tickets, :admin, :password, :password_confirmation, :attraction)
    end
    def show
        if (params[:attraction_id])
            @user = current_user
            @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
            @out_message = @ride.take_ride
        end
        @user = User.find(params[:id])
    end
end
