class UserController < ApplicationController
    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.create(user_params)
        binding.pry

        redirect_to users_path(@user)
    end

    def show
        binding.pry

        @user = User.find(user_params)
        binding.pry
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
