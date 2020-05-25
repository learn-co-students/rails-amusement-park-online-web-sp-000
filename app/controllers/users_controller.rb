class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def index
    end
    def show
        if session[:user_id]
            @user = User.find(params[:id])
        else
            redirect_to root_path
        end
        
    end
    def edit
    end
    def update
    end
    def destroy
    end
    private
        def user_params
            params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
        end
end