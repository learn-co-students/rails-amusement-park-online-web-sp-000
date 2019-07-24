class SessionsController < ApplicationController

    #Log in form 
    def new 
        @user = User.new 
        @users = User.all 
    end 

    def create 
           user = User.find_by(name: params[:user][:name])
              
           if user && user.authenticate(params[:password])
           #make a key in session called user_id and use user's id
               session[:user_id] = user.id 
               redirect_to user_path(user)
           else 
               render :new
           end 
       
    end 

    def welcome 
    end 

    def destroy
        reset_session
        redirect_to root_path
    end

    
end
