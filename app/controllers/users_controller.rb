class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
        else 
            render :new
        end 
        redirect_to user_path(@user)
    end 

    def index 
        @users = User.all
        redirect_to users_path
    end 

    def show 
        @user = User.find(params[:id])
    end 
    
    def signin
        @user = User.last
        
        redirect_to signin_path
    end 


    private 
        def user_params
            params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :password, :happiness)
        end 
end
