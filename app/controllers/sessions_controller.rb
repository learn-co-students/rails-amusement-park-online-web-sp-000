class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user_password])
            session[:user_id]=user.id
            redirect_to "/users/#{user.id}"
        else
            redirect_to '/signin'
        end

    end

    def destroy
        reset_session
        redirect_to '/'

    end
end