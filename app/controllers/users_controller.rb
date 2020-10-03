class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            log_user_in(@user)
        else
            render :new
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end