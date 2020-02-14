class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        raise params.inspect

        @user = User.create(user_params)
        redirect_to user_path(@user.id)
    end

    def show
        @user = User.find(user_params)
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end