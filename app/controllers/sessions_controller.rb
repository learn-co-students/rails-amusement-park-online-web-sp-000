class SessionsController < ApplicationController

    def new
        @user = User.new 
    end 

    def create
        @user = User.find_by(id: params[:user_id])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = params[:user_id]
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end 
    end 

end 

