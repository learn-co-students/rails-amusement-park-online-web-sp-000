class UsersController < ApplicationController
    def new
    end

    def create
        user = User.create(user_params)
        session[:user_id] = user.id

        redirect_to user_path(user)
    end

    def signin
    end

    def signin_user
        user = User.find_by(name: params[:user_name])
        session[:user_id] = user.id

        redirect_to user_path(user)
    end

    def show
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
            render :show
        else
            redirect_to "/"
        end
    end

    def destroy
        if session[:user_id]
            reset_session
        end
        redirect_to "/"
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end
end