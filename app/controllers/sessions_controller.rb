class SessionsController < ApplicationController

    def new
        @user = User.new
        #byebug 
    end

    def create
        byebug
        if user = User.find_by(params[:user_id])
            byebug
            if user.authenticate(params[:password])
               session[:user_id] = user.id
               redirect_to user
            else
               render :new 
            end
         end
    end

    def destroy
        if session[:user_id]
            session.destroy
            redirect_to root_path
        end
    end
end