class UsersController < ApplicationController
     before_action :redirect_if_not_logged_in, :except=>[:new,:create]
     include ApplicationHelper


    def new
        @user = User.new
    end

    def create
        @user= User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            # byebug
            redirect_to user_path(@user)
        else
            render :new
        end

    end

    def show

    end

    def edit

    end

    def update
       
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :tickets, :height, :happiness, :nausea, :admin)
    end
end
