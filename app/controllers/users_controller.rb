class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        # if @user.admin
        #     raise params.inspect
        # end
        if @user.errors.any?
            render 'new'
        else
            session[:user_id] = @user.id
            redirect_to(@user)
        end
    end

    def show
        @user = User.find(params[:id])
        if @user.id != session[:user_id]
            redirect_to 'index'
        end
    end

    def index
    end

    private 
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
