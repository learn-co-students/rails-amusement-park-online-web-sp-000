class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user.nil?
            redirect_to '/signin'
        else
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                redirect_to '/signin'
            end
        end

    end

    def destroy
        session.destroy
        redirect_to root_url
    end

end
