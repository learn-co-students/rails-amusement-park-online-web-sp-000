class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(id: params[:user][:name])
        user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private
    def session_params
        params.require(:user).permit(:name, :password)
    end
end