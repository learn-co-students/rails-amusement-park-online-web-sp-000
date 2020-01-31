class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def show
        @user = User.find(params[:id])
        @user.rides.build(:attraction_id => params[:attraction_id], :user_id => @user.id).save if params[:attraction_id]
        redirect_to '/' if !session[:user_id]
    end

    private

    def user_params
        params.require(:user).permit(:name, :tickets, :height, :nausea, :happiness, :password, :admin)
    end
end
