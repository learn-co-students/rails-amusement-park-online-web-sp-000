class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to @user
        end
    end

    def show
        if logged_in?
            @user = User.find_by(id: params[:id])
        else
            redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :happiness, :height, :nausea, :tickets, :admin, :password)
    end
end
