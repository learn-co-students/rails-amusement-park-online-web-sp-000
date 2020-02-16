class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        if @user.admin == true
            render '/admin/show'
        else 
            redirect_to user_path(@user)
        end
    end

    def show
        #binding.pry
        @user = User.find(session[:user_id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end


