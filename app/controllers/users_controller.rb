class UsersController < ApplicationController
     #before_action :authenticate_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
   end

    def show
        @user = User.find_by(id: params[:id])
        #binding.pry
        if current_user != @user 
            if current_user == nil || !current_user.admin
                redirect_to root_path
            end
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end
end
