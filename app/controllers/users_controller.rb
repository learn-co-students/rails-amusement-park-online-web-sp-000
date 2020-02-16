class UsersController < ApplicationController
    before_action :authenticate_user, :except => [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
                if @user.admin == true
                    render '/admin/show'
                else 
                    redirect_to user_path(@user)
            end
        else 
            redirect_to root_path
        end
    end

    def show
        if @user = User.find(session[:user_id])
            render '/users/show'
        else 
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end


