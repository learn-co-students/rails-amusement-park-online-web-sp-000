class UsersController < ApplicationController


    def new
        @user = User.new 
    end 

    def create
        @user = User.create(user_params)
        @user.save 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def show
        byebug
        @user = User.find_by(id: params[:id])
    end 

    def signin
        @user = User.find_or_create_by(name: params[:name])
    end 


    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end

end 