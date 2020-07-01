class SessionsController < ApplicationController
    def new 
        @users = User.all
    end 

    def create 
        @user = User.find_by(id: params[:user_name])
        # if user && user.authenticate(params[:password])
        #   session[:user_id] = user.id
        # else, show form again
        #   render 'sessions/new' 

        # How do you log someone in?
        return redirect_to login_path unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def destroy
        session.delete :user_id
        redirect_to root_path 
    end 
end
