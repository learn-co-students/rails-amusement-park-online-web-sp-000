class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
        if @user.admin == true
            render 'admin'
        end
    end

    private
 
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
 
    def require_login
        redirect_to root_path unless session.include? :user_id
    end

end