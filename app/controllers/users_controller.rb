class UsersController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :home]

    def new
        @user = User.new
    end

    def create
        #binding.pry
        @user = User.create(user_params)
        
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        
        @user = User.find(params[:id])
    end

    def home

    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def require_login
        if session.include? :user_id

        else
            redirect_to "/"
        end
    end
end
