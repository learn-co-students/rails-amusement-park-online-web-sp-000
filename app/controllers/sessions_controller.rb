class SessionsController < ApplicationController
    def signup
        
    end

    def create
      @user = User.find_by(id: params[:user_name])
      if @user
        if @user.authenticate(params[:user_password]) || @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

    def destroy
      session.clear
      redirect_to root_path
    end
end
