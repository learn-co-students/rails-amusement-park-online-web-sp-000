class SessionsController < ApplicationController

    def new 
       
    end 

    def create 
        @user = User.find_by_id(params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id]=@user.id
            redirect_to user_path(@user)
        else
            redirect_to "/"
        end
    end
   



end

    
        
