class UsersController < ApplicationController 
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)     
        else
            flash[:message] = "Invalid Sign Up"
            render :new 
        end
    end

    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            flash[:message] = "You must be logged in to view that."

            redirect_to root_path
        end
    end

    def index
    end  

    private 

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end 
