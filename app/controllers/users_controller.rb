class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    end

    def show
        # > error is happening b/c I'm not differentiating between admin and non admin- do that here
        @user = User.find(session[:user_id])
        if @user.admin == true
            render '/admin/index'
        else 
            render '/users/show'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end