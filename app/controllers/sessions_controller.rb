class SessionsController < ApplicationController
    def sign_in
        @user = User.new
    end 

    def create 
        @user = User.find_by(name: params[:user][:name])
        @admin = @user if @user.admin == true 

        if @user && @user.authenticate(params[:user_password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            render 'sign_in'
          end
    end

    # private 
    def sessions_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :password, :happiness)
    end 
end
