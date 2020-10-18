class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def index
    end

    def create
        @user = User.create(user_params)
        redirect_to users_path(@user)
    end

    def show
        @user = User.find(user_params)
    end


    private
    def user_params
        params.require(:user).permit(
            :name,
            :password,
            :nausea,
            :happiness,
            :height,
            :tickets,
            :admin
        )
    end
end
