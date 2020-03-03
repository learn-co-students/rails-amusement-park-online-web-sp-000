require 'pry'

class UsersController < ApplicationController
    before_action :set_user, :only => [:show]


    def new
        @user = User.new 
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def set_user
        @user = User.find(params[:id])
    end


end
