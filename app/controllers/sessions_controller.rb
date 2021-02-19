class SessionsController < ApplicationController

    def new

    end

    def create
        #  byebug
        # user = User.find_by(name: params[:user][:name])
        #  if user && user.authenticate(params[:user][:password])
        # # if user && user.password == params[:user][:password]
        #     session[:user_id] = user.id
        #     redirect_to "/users/#{user.id}"
        # else
        #     flash[:message] = "Incorrect login info, please try again"
        #     redirect_to "/login"
        # end
        
        user = User.find_by(id: params[:user_name])
         if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else
            flash[:message] = "Incorrect login info, please try again"
            redirect_to "/login"
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    
end
