class SessionsController < ApplicationController 

    def signin
        @user = User.new
    end 

    def login
        user = User.find_by(name:  params[:user][:name]) 
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:failure] = "Invalid Login!"
            render :signin
        end 
    end 

    def logout 
        session.clear
        flash[:success] = "Successfully Logged Out."
        redirect_to root_path
    end 

end 
