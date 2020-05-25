class SessionController < ApplicationController
    def new
    end
    def signin
        if @user = User.find_by(:name => params[:user][:name])
            if @user.authenticate(params[:password])  
                session[:user_id] = @user.id
                redirect_to user_path @user
            else
                flash[:alert] = "Incorrect Password"
                render :new
            end
        else
            flash[:alert] = "Cannot find a user by that name."
            render :new
        end
    end
    def destroy
        reset_session
        redirect_to root_path
    end
end