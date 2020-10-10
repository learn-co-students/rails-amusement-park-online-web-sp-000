class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]
    def new
        @user = User.new
    end

    def create 
        #binding.pry
        @user = User.new(user_params)
        @user.admin = true if params[:user][:admin] == "1"
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end 
    end 


    def show 
        @user = User.find_by(id: params[:id])
    end 

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 
end

