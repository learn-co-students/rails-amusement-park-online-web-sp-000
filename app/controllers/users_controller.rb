class UsersController < ApplicationController

    def new
        # signup form
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            # byebug
            session[:user_id] = @user.id
            redirect_to users_show_path(@user)
        else
            redirect_to users_new_path
        end
    end

    def show
        #byebug
        @user = User.find(params[:id])
        #byebug
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets)
    end
end