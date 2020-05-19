class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.mood
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        
        if params[:id].to_i > 0
            @user = User.find_by(id: params[:id])
            if !session[:user_id]
                redirect_to root_path 
            end
        else 
            @user = User.find_by(id: params[:user][:id])
            params[:id] = @user.id
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
        
    end

    def signin
        @users = User.all
        
    end

    def logout 
        session.clear
        redirect_to root_path
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end 

end
