class UserController < ApplicationController

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end

end
