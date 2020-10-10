class SessionsController < ApplicationController
    before_action :authorized, except: [:new, :create]

    def new 
    end 

    def create 
        #binding.pry
        @user = User.find_by(name: params[:user][:name])
        
    
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            

            redirect_to user_path(@user)  
        else 
            flash[:alert] = "User not found."
            redirect_to root_path
        end 
    end

    def destroy 
        reset_session 
        redirect_to root_path
    end
end 
