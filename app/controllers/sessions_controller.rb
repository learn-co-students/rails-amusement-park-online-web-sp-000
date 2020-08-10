class SessionsController < ApplicationController 

    def create 
        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])

        return redirect_to(controller: 'sessions', action: 'new') unless @user

        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def new 
        @user = User.new
    end

    def destroy
        session.delete :user_id

        redirect_to '/'
    end

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_digest, :nausea, :happiness, :admin, :tickets, :height)
    end

end