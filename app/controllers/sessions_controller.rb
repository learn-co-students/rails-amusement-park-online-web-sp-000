class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user_password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render :new
        end
    end

    def destroy
        if current_user
            session.delete :user_id
        end
        redirect_to root_path
    end
end