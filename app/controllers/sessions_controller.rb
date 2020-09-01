class SessionsController < ApplicationController 
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @new = User.new
    end 

    def create 
        user = User.find_by(:name => params[:user_name])
        
        if user
            session[:user_id] = user.id
            
            redirect_to user_path(user)
        else 
            render 'new'
        end 
    end 

    def destroy
        session.delete("user_id")
        redirect_to root_path 
    end 

end 