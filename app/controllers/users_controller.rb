class UsersController < ApplicationController
    def index
    end

    def show
        if session[:user_id] == nil
            redirect_to '/'
        else
            @user = User.find(params[:id])
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
          render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

end