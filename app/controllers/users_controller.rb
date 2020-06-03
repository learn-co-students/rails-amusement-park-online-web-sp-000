class UsersController < ApplicationController 
    #skip_before_action :verify_user, only: [:new, :create]

    def index 
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new 
    end

    def create 
        
        if @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user), alert: "You Just Signed Up" 
        else 
            render :new
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit 
        end
    end

    def ride 
        @ride = Ride.new(user_id: current_user.id, attraction_id: params[:format])
        msg = @ride.take_ride
        redirect_to user_path(current_user), alert: msg
    end

    
    private 

    def user_params 
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end