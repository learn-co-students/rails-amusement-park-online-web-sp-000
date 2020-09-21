class UsersController < ApplicationController

    def home 
    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new
        end 
    end 

    def index 
        @users = User.all
        redirect_to users_path
    end 

    def show 
        @user = User.find(params[:id])
        if !logged_in? 
            redirect_to root_path
        end 
    end 

    def update 
        binding.pry
    end 



    private 
        def user_params
            params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :password, :happiness)
        end 
end
