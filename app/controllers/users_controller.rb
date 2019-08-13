class UsersController < ApplicationController
    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        
        @user = User.new(params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin))
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
end
