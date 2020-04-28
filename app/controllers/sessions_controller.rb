class SessionsController < ApplicationController

    skip_before_action :require_logged_in, only: [:login, :create]

    def login
        @user = User.new
        @users = User.all
    end

    def create
        if  @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

    private

    def sessions_params
        params.require(:user).permit(:name)
    end


end