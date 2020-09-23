class SessionsController < ApplicationController

    def sign_in
        @user = User.new
    end 

    def create 
        if @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            render 'new'
          end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end 

    # private 
    def sessions_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :password, :happiness)
    end 
end
