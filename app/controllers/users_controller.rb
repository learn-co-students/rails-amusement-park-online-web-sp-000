class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        params[:user][:admin] = params[:user][:admin] != '0'
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to root_path
        end
    end


    def welcome

    end

    private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end
