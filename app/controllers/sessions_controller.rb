class SessionsController < ApplicationController 

    def create 
        @user = User.find_by(name: params[:user][:name])
        session[user_id] = @user.id
        redirect_to user_path(@user)
    end

    def new 
        @user = User.new
    end

    def destroy
    end

end