require 'pry'
class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if params[:user][:password]
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user.id)
            else
                redirect_to controller: 'users', action: 'new'
            end
        else
            redirect_to controller: 'users', action: 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end